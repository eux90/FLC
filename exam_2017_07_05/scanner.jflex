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
/* even number -124 -- 86 */
tk_even                       = ("-"(12[420]|1[01][86420]|[1-9][86420]|[86420]))|[86420]|[1-7][86420]|80|82|84|86
tk_word						= [a-z]{5}([a-z][a-z])*
tk_rep						= ("XX"|"XY"|"YX"|"YY"){3}("XX"|"XY"|"YX"|"YY")*
/* binary number between 10 and 11110 */
tk_bin                     = 10|11|1(0|1){2}|1(0|1){3}|10(0|1){3}|110(0|1){2}|111(00|01|10)

tk1							= {tk_even}{tk_word}?("ABC"|{tk_rep})
tk2						= {tk_bin}(("*"|"-"){tk_bin}){4}(("*"|"-"){tk_bin}("*"|"-"){tk_bin})*
/* hour between 08:12:34 - 17:21:37 */
tk3                       = (08":"12":"(3[4-9]|[4-5][0-9]))|(08":"1[3-9]":"[0-5][0-9])|(08":"[2-5][0-9]":"[0-5][0-9])|((09|1[0-6])":"[0-5][0-9]":"[0-5][0-9])|(17":"[01][0-9]":"[0-5][0-9])|(17":"20":"[0-5][0-9])|(17":"21":"([0-2][0-9]|3[0-7]))
integer					= (0|[1-9][0-9]*)
name					= [a-zA-Z][a-zA-Z0-9]*


%%

"$$"									{ yybegin(sect2); return plrs(sym.SEP, "SEP"); }
{tk1}									{ return plrs(sym.TK1, "TK1"); }
{tk2}									{ return plrs(sym.TK2, "TK2"); }
{tk3}									{ return plrs(sym.TK3, "TK3"); }
";"			                       { return plrs(sym.S, "S"); }
"%" ~ {nl}                      {;}
{ws}|{nl}                         {;}
.                                 {System.out.println("SCANNER ERROR: " + yytext());}
<sect2>"-"                               { return plrs(sym.MINUS, "MINUS"); }
<sect2>"+"                               { return plrs(sym.PLUS, "PLUS"); }
<sect2>"?"                               { return plrs(sym.QM, "QM"); }
<sect2>";"			                       { return plrs(sym.S, "S"); }
<sect2>"=="                               { return plrs(sym.EQUAL, "EQUAL"); }
<sect2>"="                               { return plrs(sym.EQ, "EQ"); }
<sect2>"."			                          { return plrs(sym.DT, "DT"); }
<sect2>":"                          			{ return plrs(sym.CL, "CL"); }
<sect2>","			                          { return plrs(sym.CM, "CM"); }
<sect2>"and"                               { return plrs(sym.AND, "AND"); }
<sect2>"or"                               { return plrs(sym.OR, "OR"); }
<sect2>"not"                               { return plrs(sym.NOT, "NOT"); }
<sect2>"set"                               { return plrs(sym.SET, "SET"); }
<sect2>"position"                               { return plrs(sym.POS, "POS"); }
<sect2>"fuel"                               { return plrs(sym.FUEL, "FUEL"); }
<sect2>"declare"                               { return plrs(sym.DEC, "DECLARE"); }
<sect2>"mv"                               { return plrs(sym.MV, "MV"); }
<sect2>"increases"                               { return plrs(sym.INC, "INC"); }
<sect2>"decreases"                               { return plrs(sym.DECREASE, "DECREASE"); }
<sect2>"min"                               { return plrs(sym.MIN, "MIN"); }
<sect2>"max"                               { return plrs(sym.MAX, "MAX"); }
<sect2>"else"                               { return plrs(sym.ELSE, "ELSE"); }
<sect2>"("                               { return plrs(sym.RO, "RO"); }
<sect2>")"                               { return plrs(sym.RC, "RC"); }
<sect2>"{"                               { return plrs(sym.BO, "BO"); }
<sect2>"}"                               { return plrs(sym.BC, "BC"); }
<sect2>{integer} 								{ return plrs(sym.INT, new Integer(yytext()), "INT"); }
<sect2>{name} 								{ return plrs(sym.NAME, new String(yytext()), "NAME"); }
<sect2>"%" ~ {nl}                      {;}
<sect2>{ws}|{nl}                         {;}
<sect2>.                                 {System.out.println("SCANNER ERROR: " + yytext());}
