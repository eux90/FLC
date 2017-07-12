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

nl = \r|\n|\r\n
ws = [ \t]
id = [A-Za-z_][A-Za-z0-9_]*
integer =  ([1-9][0-9]*|0)
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?

%%

"("     {if(_DEBUG)
          System.out.println("RO: " + yytext());
          return symbol(sym.RO);}
")"     {if(_DEBUG)
          System.out.println("RC: " + yytext());
          return symbol(sym.RC);}
"{"     {if(_DEBUG)
          System.out.println("BO: " + yytext());
          return symbol(sym.BO);}
"}"     {if(_DEBUG)
          System.out.println("BC: " + yytext());
          return symbol(sym.BC);}
"="     {if(_DEBUG)
          System.out.println("EQ: " + yytext());
          return symbol(sym.EQ);}
"+"     {if(_DEBUG)
          System.out.println("PLUS: " + yytext());
          return symbol(sym.PLUS);}
"-"     {if(_DEBUG)
          System.out.println("MINUS: " + yytext());
          return symbol(sym.MINUS);}
"*"     {if(_DEBUG)
          System.out.println("STAR: " + yytext());
          return symbol(sym.STAR);}
"/"     {if(_DEBUG)
          System.out.println("DIV: " + yytext());
          return symbol(sym.DIV);}
"<"     {if(_DEBUG)
          System.out.println("MIN: " + yytext());
          return symbol(sym.MIN);}
">"     {if(_DEBUG)
          System.out.println("MAJ: " + yytext());
          return symbol(sym.MAJ);}
"<="    {if(_DEBUG)
          System.out.println("MIN_EQ: " + yytext());
          return symbol(sym.MIN_EQ);}
"=<"    {if(_DEBUG)
          System.out.println("EQ_MIN: " + yytext());
          return symbol(sym.EQ_MIN);}
">="    {if(_DEBUG)
          System.out.println("MAJ_EQ: " + yytext());
          return symbol(sym.MAJ_EQ);}
"=>"    {if(_DEBUG)
          System.out.println("EQ_MAJ: " + yytext());
          return symbol(sym.EQ_MAJ);}
"&"     {if(_DEBUG)
          System.out.println("AND: " + yytext());
          return symbol(sym.AND);}
"|"     {if(_DEBUG)
          System.out.println("OR: " + yytext());
          return symbol(sym.OR);}
"!"     {if(_DEBUG)
          System.out.println("NOT: " + yytext());
          return symbol(sym.NOT);}

"["     {if(_DEBUG)
          System.out.println("SO: " + yytext());
          return symbol(sym.SO);}
"]"     {if(_DEBUG)
          System.out.println("SC: " + yytext());
          return symbol(sym.SC);}

"int"   {if(_DEBUG)
          System.out.println("INT_TYPE: " + yytext());
          return symbol(sym.INT_TYPE);}
"double" {if(_DEBUG)
          System.out.println("DOUBLE_TYPE: " + yytext());
          return symbol(sym.DOUBLE_TYPE);}

"print"   {if(_DEBUG)
          System.out.println("PRINT: " + yytext());
          return symbol(sym.PRINT);}
"if"      {if(_DEBUG)
          System.out.println("IF: " + yytext());
          return symbol(sym.IF);}
"while"   {if(_DEBUG)
          System.out.println("WHILE: " + yytext());
          return symbol(sym.WHILE);}
"else"    {if(_DEBUG)
          System.out.println("ELSE: " + yytext());
          return symbol(sym.ELSE);}
";"       {if(_DEBUG)
          System.out.println("S: " + yytext());
          return symbol(sym.S);}
","       {if(_DEBUG)
          System.out.println("CM: " + yytext());
          return symbol(sym.CM);}

{id}      {if(_DEBUG)
            System.out.println("ID: " + yytext());
            return symbol(sym.ID, yytext());}
{integer} {if(_DEBUG)
            System.out.println("INT: " + yytext());
            return symbol(sym.INT, new Integer(yytext()));}
{double}  {if(_DEBUG)
          System.out.println("DOUBLE: " + yytext());
          return symbol(sym.DOUBLE, new Double(yytext()));}

"/*" ~ "*/"     {;}

{ws}|{nl}       {;}

. {System.out.println("SCANNER ERROR: "+yytext());}
