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


ev_letter	= [a-z]{4}([a-z][a-z])*
odd_letter	= [A-Z]{5}([A-Z][A-Z])*
/* binary number between 110 and 10101 */
binary_range                     = (110|111|1(0|1){3}|100(0|1){2}|10100|10101)
tk1 = "?"({ev_letter}|{odd_letter}){binary_range}?
tk_word	= (("ij"|"ji"|"ii"|"jj"){3}|("ij"|"ji"|"ii"|"jj"){6})
tk2 = {tk_word}("+"|"-"){tk_word}(("+"|"-"){tk_word}("+"|"-"){tk_word})*
/* a date between 2016/05/28 and 2016/08/15 excluding 2016/06/24 */
date                       = 2016(("/"05"/"(2[89]|3[01]))|("/"06"/"(0[0-9]|1[0-9]|2[0-35-9]|30))|("/"07"/"(0[0-9]|[12][0-9]|3[01]))|("/"08"/"(0[0-9]|[1][0-5])))
var = [A-Za-z][a-zA-Z0-9]*
integer = ([1-9][0-9]*|0)



%%
"##"									{ yybegin(sect2); return plrs(sym.SEP, "SEP"); }
{tk1}									{ return plrs(sym.TK1, "TK1"); }
{tk2}									{ return plrs(sym.TK2, "TK2"); }
{date}									{ return plrs(sym.DATE, "DATE"); }
";"			              { return plrs(sym.S, "S"); }
"/*" ~ "*/" {;}
{ws}|{nl}             {;}
.                     {System.out.println("SCANNER ERROR: " + yytext());}

<sect2>"+"   { return plrs(sym.PLUS, "PLUS"); }
<sect2>"-"   { return plrs(sym.MINUS, "MINUS"); }
<sect2>"*"   { return plrs(sym.STAR, "STAR"); }
<sect2>"/"   { return plrs(sym.DIV, "DIV"); }
<sect2>"="   { return plrs(sym.EQ, "EQ"); }
<sect2>"("   { return plrs(sym.RO, "RO"); }
<sect2>")"   { return plrs(sym.RC, "RC"); }
<sect2>"{"   { return plrs(sym.BO, "BO"); }
<sect2>"}"   { return plrs(sym.BC, "BC"); }
<sect2>"MIN" { return plrs(sym.MIN, "MIN"); }
<sect2>"MAX" { return plrs(sym.MAX, "MAX"); }
<sect2>"stat" { return plrs(sym.STAT, "STAT"); }
<sect2>"case" { return plrs(sym.CASE, "CASE"); }
<sect2>"switch" { return plrs(sym.SWITCH, "SWITCH"); }
<sect2>"print" { return plrs(sym.PRINT, "PRINT"); }
<sect2>":"   { return plrs(sym.CL, "CL"); }
<sect2>","		{ return plrs(sym.CM, "CM"); }
<sect2>";"		{ return plrs(sym.S, "S"); }
<sect2>{var}		{ return plrs(sym.VAR, new String(yytext()), "VAR"); }
<sect2>{integer}		{ return plrs(sym.INT, new Integer(yytext()), "INT"); }
<sect2>{ws}|{nl} {;}
<sect2>"/*" ~ "*/" {;}
<sect2>. {System.out.println("SCANNER ERROR: " + yytext());}
