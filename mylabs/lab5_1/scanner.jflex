import java.io.*;
import java_cup.runtime.*;

%%

%class scanner
%cup
%standalone
%line
%column

%{
 private final static boolean DEBUG = false;
 private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);

  }
%}

integer                = ([1-9][0-9]*)|0
real                   = {integer}"."[0-9]+
exp                    = ("e"|"E")"-"?{integer}
number                 = ({integer}|{real}){exp}?
scvar                  = [a-z]
vcvar                  = [A-Z]
nl                     = \r|\n|\r\n
ws                     = " "|\t

%%

{number}            {if(DEBUG)
                      System.out.println("NUMBER: " + yytext());
                      return symbol(sym.NUMBER, new Double(yytext()));}
{scvar}             {if(DEBUG)
                      System.out.println("SCALAR VAR: " + yytext());
                      return symbol(sym.SCVAR, new Character(yycharat(0)));}
{vcvar}             {if(DEBUG)
                      System.out.println("VECTOR VAR: " + yytext());
                      return symbol(sym.VCVAR, new Character(yycharat(0)));}
"["                 {if(DEBUG)
                      System.out.println("SO : " + yytext());
                      return symbol(sym.SO);}
"]"                 {if(DEBUG)
                      System.out.println("SC : " + yytext());
                      return symbol(sym.SC);}
","                 {if(DEBUG)
                      System.out.println("C : " + yytext());
                      return symbol(sym.C);}
";"                 {if(DEBUG)
                      System.out.println("S : " + yytext());
                      return symbol(sym.S);}
"="                 {if(DEBUG)
                      System.out.println("EQ : " + yytext());
                      return symbol(sym.EQ);}
"+"                 {if(DEBUG)
                      System.out.println("PLUS : " + yytext());
                      return symbol(sym.PLUS);}
"-"                 {if(DEBUG)
                      System.out.println("MIN : " + yytext());
                      return symbol(sym.MIN);}
"*"                 {if(DEBUG)
                      System.out.println("MUL : " + yytext());
                      return symbol(sym.MUL);}
"/"                 {if(DEBUG)
                      System.out.println("DIV : " + yytext());
                      return symbol(sym.DIV);}
"."                 {if(DEBUG)
                      System.out.println("SCPR : " + yytext());
                      return symbol(sym.SCPR);}
"^"                 {if(DEBUG)
                      System.out.println("EXP : " + yytext());
                      return symbol(sym.EXP);}
"("                 {if(DEBUG)
                      System.out.println("RO : " + yytext());
                      return symbol(sym.RO);}
")"                 {if(DEBUG)
                      System.out.println("RC : " + yytext());
                      return symbol(sym.RC);}
"?"                 {if(DEBUG)
                      System.out.println("END : " + yytext());
                      return symbol(sym.END);}
{nl}|{ws}           {;}
.                   {System.out.println("ERROR : " + yytext());}
