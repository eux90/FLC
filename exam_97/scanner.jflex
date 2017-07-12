import java_cup.runtime.*;

%%

%class scanner
%unicode
%cup
%line
%column

%{
  private final static boolean _DEBUG = false;
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);

  }
%}

nl                = \r|\n|\r\n
ws                = [ \t]
word              = [A-Za-z_][A-Za-z0-9_]*
integer           = ([1-9][0-9]*|0)

%%
"->"             {if(_DEBUG)
                  System.out.println("ASS: " + yytext());
                  return symbol(sym.ASS);}
{word}          {if(_DEBUG)
                  System.out.println("WORD: " + yytext());
                  return symbol(sym.WORD, yytext());}
{integer}       {if(_DEBUG)
                  System.out.println("INT: " + yytext());
                  return symbol(sym.INT, new Integer(yytext()));}
"*"             {if(_DEBUG)
                  System.out.println("E: " + yytext());
                  return symbol(sym.E, new Integer(3));}
"+"             {if(_DEBUG)
                  System.out.println("G: " + yytext());
                  return symbol(sym.G, new Integer(2));}
"/"             {if(_DEBUG)
                  System.out.println("S: " + yytext());
                  return symbol(sym.S, new Integer(1));}
"-"             {if(_DEBUG)
                  System.out.println("U: " + yytext());
                  return symbol(sym.U, new Integer(0));}
"("             {if(_DEBUG)
                  System.out.println("RO: " + yytext());
                  return symbol(sym.RO);}
")"             {if(_DEBUG)
                  System.out.println("RC: " + yytext());
                  return symbol(sym.RC);}
","             {if(_DEBUG)
                  System.out.println("CM: " + yytext());
                  return symbol(sym.CM);}
";"             {if(_DEBUG)
                  System.out.println("SC: " + yytext());
                  return symbol(sym.SC);}
":"             {if(_DEBUG)
                  System.out.println("C: " + yytext());
                  return symbol(sym.C);}
"="             {if(_DEBUG)
                  System.out.println("EQ: " + yytext());
                  return symbol(sym.EQ);}
"."             {if(_DEBUG)
                  System.out.println("D: " + yytext());
                  return symbol(sym.D);}
"//" ~ {nl}      {;}
{ws}|{nl}        {;}
.                {System.out.println("SCANNER ERROR: "+yytext());}
