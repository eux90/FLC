import java_cup.runtime.*;

%%

%class scanner
%unicode
%cup
%standalone
%line
%column
%xstate sect2

%{

  private static final boolean _DEBUG = false;

  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);

  }
  private Symbol plrs(int type, String message){
    if(_DEBUG){
      System.out.println(message + " " + yytext());
    }
    return symbol(type);
  }
  private Symbol plrs(int type, Object value, String message){
    if(_DEBUG){
      System.out.println(message + " " + yytext());
    }
    return symbol(type, value);
  }
%}

nl                                = \n|\r|\r\n
ws                                = " "|\t
tk_w                              = ("xx"|"xy"|"xz"|"yy"|"yx"|"yz"|"zx"|"zy"|"zz"){3}("xx"|"xx"|"xz"|"yy"|"yx"|"yz"|"zx"|"zy"|"zz")*
tk_hex                            = ("-"(3[DdFfBb97531]|2[DdFfBb97531]|1[DdFfBb97531]|[DdFfBb97531]))|([DdFfBb97531]|[1-9A-Fa-f][DdFfBb97531]|[1-9][1-9A-Fa-f][DdFfBb97531]|[aA][aA97531][DdFfBb97531]|[aA][bB][135])

bin                        = ((0|1){3})|((0|1){15})

code                              = {tk_w}"|"{tk_hex}?
/* hour between 10:11:12 - 15:36:47 */
hour                       = (10":"11":"(1[2-9]|[2-5][0-9]))|(10":"1[2-9]":"[0-5][0-9])|(10":"[2-5][0-9]":"[0-5][0-9])|(1[1-4]":"[0-5][0-9]":"[0-5][0-9])|(15":"[12][0-9]":"[0-5][0-9])|(15":"3[0-5]":"[0-5][0-9])|(15":"36":"([0-3][0-9]|4[0-7]))
number                     = ({bin}(("."|"-"|"+"){bin}){3})|({bin}(("."|"-"|"+"){bin}){5})
name                       = [A-Z][A-Z0-9_]*
att                        = [a-z]+
int                        = (0|[0-9][1-9]*)




%%

{code}	                         	{ return plrs(sym.CODE, "CODE"); }
{hour}	                         	{ return plrs(sym.HOUR, "HOUR"); }
{number}	                         	{ return plrs(sym.NUMBER, "NUMBER"); }
"##"                              { yybegin(sect2); return plrs(sym.SEP, "SEP"); }
";"			                          { return plrs(sym.S, "S"); }
"//" ~ {nl}                       {;}
"/*" ~ "*/"                       {;}
{ws}|{nl}                         {;}
.                                 {System.out.println("SCANNER ERROR: " + yytext());}



<sect2>"##"                              { return plrs(sym.SEP, "SEP"); }
<sect2>";"			                          { return plrs(sym.S, "S"); }
<sect2>","			                          { return plrs(sym.CM, "CM"); }
<sect2>"="                               { return plrs(sym.EQ, "EQ"); }
<sect2>"."			                          { return plrs(sym.DT, "DT"); }
<sect2>"=="                               { return plrs(sym.EQUAL, "EQUAL"); }
<sect2>"||"                               { return plrs(sym.OR, "OR"); }
<sect2>"&&"                               { return plrs(sym.AND, "AND"); }
<sect2>"!"                               { return plrs(sym.NOT, "NOT"); }
<sect2>"("                               { return plrs(sym.RO, "RO"); }
<sect2>")"                               { return plrs(sym.RC, "RC"); }
<sect2>"["                               { return plrs(sym.SO, "SO"); }
<sect2>"]"                               { return plrs(sym.SC, "SC"); }
<sect2>"+"                               { return plrs(sym.PLUS, "PLUS"); }
<sect2>"-"                               { return plrs(sym.MINUS, "MINUS"); }
<sect2>"INIT"                               { return plrs(sym.INIT, "INIT"); }
<sect2>"DEFAULT"                               { return plrs(sym.DEFAULT, "DEFAULT"); }
<sect2>"WHEN"                               { return plrs(sym.WHEN, "WHEN"); }
<sect2>"DONE"                               { return plrs(sym.DONE, "DONE"); }
<sect2>"CASE"                               { return plrs(sym.CASE, "CASE"); }
<sect2>"NEXT"                               { return plrs(sym.NEXT, "NEXT"); }
<sect2>"DO"                               { return plrs(sym.DO, "DO"); }
<sect2>"PRINT"                               { return plrs(sym.PRINT, "PRINT"); }
<sect2>\" ~ \"                              { return plrs(sym.QUOT, new String(yytext()), "QUOT"); }
<sect2>{int}	                         	{ return plrs(sym.INT, new Integer(yytext()), "INT"); }
<sect2>{name}	                         	{ return plrs(sym.NAME, new String(yytext()), "NAME"); }
<sect2>{att}	                         	{ return plrs(sym.ATT, new String(yytext()), "ATT"); }
<sect2>"//" ~ {nl}                       {;}
<sect2>"/*" ~ "*/"                       {;}
<sect2>{ws}|{nl}                         {;}
<sect2>.                                 {System.out.println("SCANNER ERROR: " + yytext());}
