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

nl  = \n|\r|\r\n
ws  = " "|\t
comment   = "//" ~ {nl}
sep =  ("%"){4}("%%")*


/* all the alphabet letters and the special characters except: slash, backslash, colon, star, question mark, double quotes, minus, greater, OR symbol. */
letter                            = [^\n\r\\/:*?\"<> |0-9]
digit                             = [0-9]
integer                           = ([1-9][0-9]*|0)
double                            = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
lcomment                          = "/*" ~ "*/"
/* real or integer number, with or without exponent, with or without sign (but 0000 is possible) */
number 	                          = ("+"|"-")?[0-9]+("."[0-9]+(e("+"|"-")[0-9]+)?)?
/* a quoted string */
string                            = \" ~ \"
/* day 01-31 */
dd			                          =	0[1-9]|[1-2][0-9]|3[0-1]
/* month 01-12 */
mm                           			=	0[1-9]|1[0-2]
/* year 0000-9999 */
yyyy			                        =	[0-9]{4}
id                                = ({letter}|{digit})+
path                              = ({letter}:)?(\\)?({id}\\)*{id}("."{id})?
iptoken                           = [0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]
ipaddress                         = ({iptoken}.){3}{iptoken}
port                              = [1-9][0-9]{0,3}
escape                            = %[0-9A-F][0-9A-F]
name                              = ([^\n\r%/<>:.\\#]|{escape})+
firstlevel                        = it|com|gov|edu|net|uk|fr|de|ne|jp|ch
domain                            = {name}.{name}(.{name})*.{firstlevel}
schema                            = http|ftp|gopher|https|nntp|file
url                               = {schema}"://"({domain}|{ipaddress})(":"{port})?("/"{name})*("/"|("/"{name}"."{name} ("#"{name})?))?
/* consists of two numeric characters, followed by a dash, followed by two numeric characters,
followed by a dash, followed by 5 hexadecimal characters, followed by a dash and followed by a letter or a numeric character */
isbn			                        =	[0-9]{2}-[0-9]{2}-[0-9A-Fa-f]{5}-[A-Za-z0-9]

/******** FROM OLD EXAMS ************/

/* odd number between -35 and 333 */
odd_number                        = "-"(3[135]|[12][13579]|[13579])|[13579]|[1-9][13579]|[12][0-9][13579]|3([0-2][13579]|3[13])
/* even number -138 -- 824 */
even_number                       = ("-"(1[3-0][86420]|[1-9][86420]|[86420]))|[86420]|[1-9][86420]|[1-7][0-9][86420]|8[0-1][86420]|820|822|824
/* an odd repetitoion of % but at least 5 times */
rep_prc_odd                      = ("%%%%%")("%%")*
/* 2 or 3 repetition of "**" and "???" in any order */
rep_star_qm                      = ("???"|"**"){2,3}
/* a date between 2015/12/12 and 2016/03/13 excluding 2016/01/05 */
date_range                       = 2015"/"12"/"(1[2-9]|2[0-9]|3[01])|2016"/"(01"/"(0[1-46-9]|[12][0-9]|3[01])|02"/"(0[1-9]|[12][0-9])|03"/"(0[1-9]|1[0-3]))
/* hour between 04:32 - 15:47 */
hour_range                       = 04":"(3[2-9]|[45][0-9])|0[5-9]":"[0-5][0-9]|1[0-4]":"[0-5][0-9]|15":"([0-3][0-9]|4[0-7])
/* hour between 10:11:12 - 15:36:47 */
hour_range_2                       = (10":"11":"(1[2-9]|[2-5][0-9]))|(10":"1[2-9]":"[0-5][0-9])|(10":"[2-5][0-9]":"[0-5][0-9])|(1[1-4]":"[0-5][0-9]":"[0-5][0-9])|(15":"[0-2][0-9]":"[0-5][0-9])|(15":"3[0-5]":"[0-5][0-9])|(15":"36":"([0-3][0-9]|4[0-7]))
/* binary number between 101 and 101000 */
binary_range                     = (101|110|111|1(0|1){3}|1(0|1){4}|100(0|1){3}|101000)
/* odd hexadecimal between -3B -- aB5 */
hex_range                            = ("-"(3[DdFfBb97531]|2[DdFfBb97531]|1[DdFfBb97531]|[DdFfBb97531]))|([DdFfBb97531]|[1-9A-Fa-f][DdFfBb97531]|[1-9][1-9A-Fa-f][DdFfBb97531]|[aA][aA97531][DdFfBb97531]|[aA][bB][135])

%%

/* new Character(yycharat(0))) --> get a char */

{sep}								{ yybegin(sect2); return plrs(sym.SEP, "SEP"); }
//{tk1}									{ return plrs(sym.TK1, "TK1"); }
//{tk2}									{ return plrs(sym.TK2, "TK2"); }
//{tk3}									{ return plrs(sym.TK3, "TK3"); }
";"			              { return plrs(sym.S, "S"); }
{ws}|{nl}             {;}
{comment}             {;}
.                     {System.out.println("SCANNER ERROR: " + yytext());}

<sect2>"->"  { return plrs(sym.ARROW, "ARROW"); }
<sect2>":"   { return plrs(sym.CL, "CL"); }
<sect2>","		{ return plrs(sym.CM, "CM"); }
<sect2>";"		{ return plrs(sym.S, "S"); }
//<sect2>"."		{ return plrs(sym.DT, "DT"); }
<sect2>"("   { return plrs(sym.RO, "RO"); }
<sect2>")"   { return plrs(sym.RC, "RC"); }
<sect2>"["   { return plrs(sym.SO, "SO"); }
<sect2>"]"   { return plrs(sym.SC, "SC"); }
<sect2>"{"   { return plrs(sym.BO, "BO"); }
<sect2>"}"   { return plrs(sym.BC, "BC"); }
<sect2>"+"   { return plrs(sym.PLUS, "PLUS"); }
<sect2>"-"   { return plrs(sym.MINUS, "MINUS"); }
<sect2>"*"   { return plrs(sym.STAR, "STAR"); }
<sect2>"/"   { return plrs(sym.DIV, "DIV"); }
<sect2>"^"		{ return plrs(sym.EXP, "EXP"); }
<sect2>"="   { return plrs(sym.EQ, "EQ"); }
<sect2>"<"   { return plrs(sym.MIN, "MIN"); }
<sect2>">"   { return plrs(sym.MAJ, "MAJ"); }
<sect2>"<="  { return plrs(sym.MIN_EQ, "MIN_EQ"); }
<sect2>"=<"  { return plrs(sym.EQ_MIN, "EQ_MIN"); }
<sect2>">="  { return plrs(sym.MAJ_EQ, "MAJ_EQ"); }
<sect2>"=>"  { return plrs(sym.EQ_MAJ, "EQ_MAJ"); }
<sect2>"&&"   { return plrs(sym.AND, "AND"); }
<sect2>"||"   { return plrs(sym.OR, "OR"); }
<sect2>"|"   { return plrs(sym.PIPE, "PIPE"); }
<sect2>"!"   { return plrs(sym.NOT, "NOT"); }
<sect2>"AND"   { return plrs(sym.AND, "AND"); }
<sect2>"OR"   { return plrs(sym.OR, "OR"); }
<sect2>"NOT"   { return plrs(sym.NOT, "NOT"); }
<sect2>"and"   { return plrs(sym.AND, "AND"); }
<sect2>"or"    { return plrs(sym.OR, "OR"); }
<sect2>"not"   { return plrs(sym.NOT, "NOT"); }
<sect2>"?"   { return plrs(sym.QM, "QM"); }
<sect2>"%"   { return plrs(sym.PRC, "PRC"); }
<sect2>"$"   { return plrs(sym.DLR, "DLR"); }
<sect2>"#"   { return plrs(sym.HASH, "HASH"); }
<sect2>"++"  { return plrs(sym.INC, "INC"); }
<sect2>"--"  { return plrs(sym.DEC, "DEC"); }
<sect2>"=="  { return plrs(sym.EQEQ, "EQEQ"); }
<sect2>"MIN" { return plrs(sym.MINI, "MINI"); }
<sect2>"min"   { return plrs(sym.MINI, "MINI"); }
<sect2>"MAX" { return plrs(sym.MAXI, "MAXI"); }
<sect2>"max"   { return plrs(sym.MAXI, "MAXI"); }
<sect2>"AVG"   { return plrs(sym.AVG, "AVG"); }
<sect2>"avg"   { return plrs(sym.AVG, "AVG"); }
<sect2>"ADD"   { return plrs(sym.ADD, "ADD"); }
<sect2>"add"   { return plrs(sym.ADD, "ADD"); }
<sect2>"SUB"   { return plrs(sym.SUB, "SUB"); }
<sect2>"sub"   { return plrs(sym.SUB, "SUB"); }
<sect2>"INCREASE"   { return plrs(sym.INCR, "INCR"); }
<sect2>"increase"   { return plrs(sym.INCR, "INCR"); }
<sect2>"INC"   { return plrs(sym.INCR, "INCR"); }
<sect2>"inc"   { return plrs(sym.INCR, "INCR"); }
<sect2>"DECREASE"   { return plrs(sym.DECR, "DECR"); }
<sect2>"decrease"   { return plrs(sym.DECR, "DECR"); }
<sect2>"DEC"   { return plrs(sym.DECR, "DECR"); }
<sect2>"dec"   { return plrs(sym.DECR, "DECR"); }
<sect2>"EVALUATE"   { return plrs(sym.EVAL, "EVAL"); }
<sect2>"evaluate"   { return plrs(sym.EVAL, "EVAL"); }
<sect2>"TRUE"   { return plrs(sym.TRUE, new Boolean(true), "TRUE"); }
<sect2>"true"   { return plrs(sym.TRUE, new Boolean(true), "TRUE"); }
<sect2>"FALSE"   { return plrs(sym.FALSE, new Boolean(false), "FALSE"); }
<sect2>"false"   { return plrs(sym.FALSE, new Boolean(false), "FALSE"); }
<sect2>"SET"   { return plrs(sym.SET, "SET"); }
<sect2>"set"    { return plrs(sym.SET, "SET"); }
<sect2>"CASE" { return plrs(sym.CASE, "CASE"); }
<sect2>"case" { return plrs(sym.CASE, "CASE"); }
<sect2>"SWITCH" { return plrs(sym.SWITCH, "SWITCH"); }
<sect2>"switch" { return plrs(sym.SWITCH, "SWITCH"); }
<sect2>"PRINT" { return plrs(sym.PRINT, "PRINT"); }
<sect2>"print" { return plrs(sym.PRINT, "PRINT"); }
<sect2>"STAT" { return plrs(sym.STAT, "STAT"); }
<sect2>"stat" { return plrs(sym.STAT, "STAT"); }
<sect2>"INIT" { return plrs(sym.INIT, "INIT"); }
<sect2>"init"   { return plrs(sym.INIT, "INIT"); }
<sect2>"DEFAULT"  { return plrs(sym.DEFAULT, "DEFAULT"); }
<sect2>"default"   { return plrs(sym.DEFAULT, "DEFAULT"); }
<sect2>"WHEN"   { return plrs(sym.WHEN, "WHEN"); }
<sect2>"when"    { return plrs(sym.WHEN, "WHEN"); }
<sect2>"DONE"     { return plrs(sym.DONE, "DONE"); }
<sect2>"done"    { return plrs(sym.DONE, "DONE"); }
<sect2>"THEN"   { return plrs(sym.THEN, "THEN"); }
<sect2>"then"    { return plrs(sym.THEN, "THEN"); }
<sect2>"NEXT"     { return plrs(sym.NEXT, "NEXT"); }
<sect2>"next"    { return plrs(sym.NEXT, "NEXT"); }
<sect2>"DO"     { return plrs(sym.DO, "DO"); }
<sect2>"do"      { return plrs(sym.DO, "DO"); }
<sect2>"START"   { return plrs(sym.START, "START"); }
<sect2>"start"   { return plrs(sym.START, "START"); }
<sect2>"MOVE"    { return plrs(sym.MOVE, "MOVE"); }
<sect2>"move"    { return plrs(sym.MOVE, "MOVE"); }
<sect2>"SAVE"    { return plrs(sym.SAVE, "SAVE"); }
<sect2>"save"   { return plrs(sym.SAVE, "SAVE"); }
<sect2>{comment} {;}
<sect2>{ws}|{nl} {;}
<sect2>. {System.out.println("SCANNER ERROR: " + yytext());}
