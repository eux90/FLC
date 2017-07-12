import java_cup.runtime.*;

%%

%class scanner
%unicode
%cup
%standalone
%line
%column

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
even_number                       = ("-"(1[3-0][865420]|[1-9][865420]|[86542]))|[865420]|[1-9][865420]|[1-7][0-9][865420]|8[0-1][865420]|820|822|824
/* an odd repetitoion of % but at least 5 times */
rep_prc_odd                      = ("%%%%%")("%%")*
/* 2 or 3 repetition of "**" and "???" in any order */
rep_star_qm                      = ("???"|"**"){2,3}
/* a date between 2015/12/12 and 2016/03/13 excluding 2016/01/05 */
date_range                       = 2015"/"12"/"(1[2-9]|2[0-9]|3[01])|2016"/"(01"/"(0[1-46-9]|[12][0-9]|3[01])|02"/"(0[1-9]|[12][0-9])|03"/"(0[1-9]|1[0-3]))
/* hour between 04:32 - 15:47 */
hour_range                       = 04":"(3[2-9]|[45][0-9])|0[5-9]":"[0-5][0-9]|1[0-4]":"[0-5][0-9]|15":"([0-3][0-9]|4[0-7])
/* hour between 10:11:12 - 15:36:47 */
hour_range_2                       = (10":"11":"(1[2-9]|[2-5][0-9]))|(10":"1[2-9]":"[0-5][0-9])|(10":"[2-5][0-9]":"[0-5][0-9])|(1[1-4]":"[0-5][0-9]":"[0-5][0-9])|(15":"[12][0-9]":"[0-5][0-9])|(15":"3[0-5]":"[0-5][0-9])|(15":"36":"([0-3][0-9]|4[0-7]))
/* binary number between 101 and 101000 */
binary_range                     = (101|110|111|1(0|1){3}|1(0|1){4}|100(0|1){3}|101000)
/* odd hexadecimal between -3B -- aB5 */  
hex_range                            = ("-"(3[DdFfBb97531]|2[DdFfBb97531]|1[DdFfBb97531]|[DdFfBb97531]))|([DdFfBb97531]|[1-9A-Fa-f][DdFfBb97531]|[1-9][1-9A-Fa-f][DdFfBb97531]|[aA][aA97531][DdFfBb97531]|[aA][bB][135])

%%

/* new Character(yycharat(0))) --> get a char */

"->"	                         		{ return plrs(sym.ARROW, "ARROW"); }
":"                          			{ return plrs(sym.CL, "CL"); }
","			                          { return plrs(sym.CM, "CM"); }
";"			                          { return plrs(sym.S, "S"); }
"."			                          { return plrs(sym.DT, "DT"); }
"("                               { return plrs(sym.RO, "RO"); }
")"                               { return plrs(sym.RC, "RC"); }
"["                               { return plrs(sym.SO, "SO"); }
"]"                               { return plrs(sym.SC, "SC"); }
"{"                               { return plrs(sym.BO, "BO"); }
"}"                               { return plrs(sym.BC, "BC"); }
"+"                               { return plrs(sym.PLUS, "PLUS"); }
"-"                               { return plrs(sym.MINUS, "MINUS"); }
"*"                               { return plrs(sym.STAR, "STAR"); }
"/"                               { return plrs(sym.DIV, "DIV"); }
"^"			                          { return plrs(sym.EXP, "EXP"); }
"="                               { return plrs(sym.EQ, "EQ"); }
"<"                               { return plrs(sym.MIN, "MIN"); }
">"                               { return plrs(sym.MAJ, "MAJ"); }
"<="                              { return plrs(sym.MIN_EQ, "MIN_EQ"); }
"=<"                              { return plrs(sym.EQ_MIN, "EQ_MIN"); }
">="                              { return plrs(sym.MAJ_EQ, "MAJ_EQ"); }
"=>"                              { return plrs(sym.EQ_MAJ, "EQ_MAJ"); }
"&"                               { return plrs(sym.AND, "AND"); }
"|"                               { return plrs(sym.OR, "OR"); }
"!"                               { return plrs(sym.NOT, "NOT"); }
"?"                               { return plrs(sym.QM, "QM"); }
"%"                               { return plrs(sym.PRC, "PRC"); }
"$"                               { return plrs(sym.DLR, "DLR"); }
"++"                              { return plrs(sym.INC, "INC"); }
"--"                              { return plrs(sym.DEC, "DEC"); }
"//" ~ {nl}                       {;}
{ws}|{nl}                         {;}
.                                 {System.out.println("SCANNER ERROR: " + yytext());}
