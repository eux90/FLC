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

  private static final boolean _DEBUG = true;

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
integer                        = (0|[1-9][0-9]*)
name                             = [a-zA-Z]+[0-9]*
even_sep                          = "%%%%"("%%")*
odd_sep                           = "#"("##")*
even_number                     = ("-"(2[420]|1[02468]|[02468]))|([02468]|[1-9][02468]|[1-9][0-9][02468]|1[0-9][0-9][02468]|23[0-9][02468]|24[0-6][0248]|2470|2472)
odd_dl_ex                       = ("$"|"?"){5}("$$"|"$?"|"?$"|"??")*
word_tk                         = [a-zA-Z]{4}|[a-zA-Z]{6}|[a-zA-Z]{9}
code                            = {even_number}({odd_dl_ex}|{word_tk})
/* a date between 2015/12/06 and 2016/03/31 */
date_range                       = 2015"/"12"/"([6-9]1[0-9]|2[0-9]|3[01])|2016"/"(01"/"(0[1-9]|[12][0-9]|3[01])|02"/"(0[1-9]|[12][0-9])|03"/"(0[1-9]|[12][0-9]|3[01]))
/* hour between :04:32 - :15:47 */
hour_range                       = ":"((04":"(3[2-9]|[45][0-9]))|0[5-9]":"[0-5][0-9]|1[0-4]":"[0-5][0-9]|15":"([0-3][0-9]|4[0-7]))
date                            = {date_range}({hour_range})?
sep                               = {even_sep}|{odd_sep}


%%

{sep}                             { yybegin(sect2); return plrs(sym.SEP, "SEP"); }
{code}                             { return plrs(sym.CODE, "CODE"); }
{date}                             { return plrs(sym.DATE, "DATE"); }
";"			                          { return plrs(sym.S, "S"); }
{ws}|{nl}                         {;}
"//" ~ {nl}                       {;}
.                                 {System.out.println("SCANNER ERROR: " + yytext());}
<sect2>"START"                           { return plrs(sym.START, "START"); }
<sect2>"MOVE"                           { return plrs(sym.MOVE, "MOVE"); }
<sect2>"VAR"                              { return plrs(sym.VAR, "VAR"); }
<sect2>"WHEN"                              { return plrs(sym.WHEN, "WHEN"); }
<sect2>"DONE"                              { return plrs(sym.DONE, "DONE"); }
<sect2>"THEN"                              { return plrs(sym.THEN, "THEN"); }
<sect2>"AND"                              { return plrs(sym.AND, "AND"); }
<sect2>"OR"                              { return plrs(sym.OR, "OR"); }
<sect2>"NOT"                              { return plrs(sym.NOT, "NOT"); }
<sect2>{integer}                          { return plrs(sym.INT, new Integer(yytext()), "INT"); }
<sect2>{name}                            { return plrs(sym.NAME, new String(yytext()), "NAME"); }
<sect2>"+"                               { return plrs(sym.PLUS, "PLUS"); }
<sect2>"-"                               { return plrs(sym.MINUS, "MINUS"); }
<sect2>";"			                          { return plrs(sym.S, "S"); }
<sect2>","			                          { return plrs(sym.CM, "CM"); }
<sect2>":"                          			{ return plrs(sym.CL, "CL"); }
<sect2>"{"                               { return plrs(sym.BO, "BO"); }
<sect2>"}"                               { return plrs(sym.BC, "BC"); }
<sect2>"."			                          { return plrs(sym.DT, "DT"); }
<sect2>"=="                               { return plrs(sym.EQUAL, "EQUAL"); }
<sect2>"!="                               { return plrs(sym.DIF, "DIF"); }
<sect2>{ws}|{nl}                         {;}
<sect2> "//" ~ {nl}                       {;}
<sect2>.                                 {System.out.println("SCANNER ERROR: " + yytext());}
