import java.io.*;
import java_cup.runtime.*;

%%
%class scanner
%cup
%line
%column

%{
  private final static boolean DEBUG = false;
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
%}

%xstate comment

integer               = [1-9][0-9]*|0
real                  = {integer}"."[0-9]+|"."[0-9]+
number                = ("-"|"+")?({integer}|{real})((e|E)("+"|"-")[0-9]+)?
atom                  = ([a-z]|{number})[a-zA-Z0-9_]*
variable              = [_A-Z][a-zA-Z0-9_]*
ws                    = " "|\t
nl                    = \r|\n|\r\n


%%


{atom}                {if(DEBUG)System.out.println("ATOM: " + yytext());return symbol(sym.A);}
{variable}            {if(DEBUG)System.out.println("VARIABLE: " + yytext());return symbol(sym.V);}
"("                   {if(DEBUG)System.out.println("RO: " + yytext());return symbol(sym.RO);}
")"                   {if(DEBUG)System.out.println("RC: " + yytext());return symbol(sym.RC);}
","                   {if(DEBUG)System.out.println("C: " + yytext());return symbol(sym.C);}
"?-"                  {if(DEBUG)System.out.println("IS: " + yytext());return symbol(sym.IS);}
":-"                  {if(DEBUG)System.out.println("RS: " + yytext());return symbol(sym.RS);}
"."                   {if(DEBUG)System.out.println("D: " + yytext());return symbol(sym.D);}
"/*"                  {yybegin(comment);}
<comment>[^"*/"]      {;}
<comment>"*/"         {yybegin(YYINITIAL);}
{nl}|{ws}             {;}
.                     {if(DEBUG)System.out.println("*** ERROR ***: " + yytext());}
