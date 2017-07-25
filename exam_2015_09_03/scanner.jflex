import java_cup.runtime.*;

%%

%class scanner
%unicode
%standalone
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

ws                                                          = " "|\t
nl                                                          = \r|\n|\r\n
/* odd number between -35 and 333 */
odd_number                                                  = "-"(3[135]|[12][13579]|[13579])|[13579]|[1-9][13579]|[12][0-9][13579]|3([0-2][13579]|3[13])
/* an odd repetitoion of % but at least 5 times, 2 or 3 repetition of "**" and "???" in any order and the optional odd number at the end */
token1                                                      = (("%%%%%")("%%")*|(("???"|"**"){2,3})){odd_number}?
/* a date between 2015/12/12 and 2016/03/13 excluding 2016/01/05 */
date                                                        = 2015"/"12"/"(1[2-9]|2[0-9]|3[01])|2016"/"(01"/"(0[1-46-9]|[12][0-9]|3[01])|02"/"(0[1-9]|[12][0-9])|03"/"(0[1-9]|1[0-3]))
/* two dates in the range above separated dy + or - */
token2                                                      = {date}("-"|"+"){date}
/* $ followed by a binary number between 101 and 101000 */
token3                                                      = "$"(101|110|111|1(0|1){3}|1(0|1){4}|100(0|1){3}|101000)
name                                                        = \"[A-Za-z_0-9]+\"
integer                                                     = (0|[1-9][0-9]*)
sep                                                         = "####"("##")*
cpp_comment                                                 = "//" ~ {nl}





%%
{token1}                 {if(_DEBUG)
                          System.out.println("TOKEN1: " + yytext());
                          return symbol(sym.TK1);}
{token2}                 {if(_DEBUG)
                          System.out.println("TOKEN2: " + yytext());
                          return symbol(sym.TK2);}
{token3}                 {if(_DEBUG)
                          System.out.println("TOKEN3: " + yytext());
                          return symbol(sym.TK3);}
{name}                   {if(_DEBUG)
                          System.out.println("NAME: " + yytext());
                          return symbol(sym.NAME, new String(yytext()));}
{integer}                {if(_DEBUG)
                          System.out.println("INTEGER: " + yytext());
                          return symbol(sym.INT, new Integer(yytext()));}
{sep}                    {if(_DEBUG)
                          System.out.println("SEP: " + yytext());
                          return symbol(sym.SEP);}
"PRINT_MIN_MAX"          {if(_DEBUG)
                          System.out.println("PRINT_M_M: " + yytext());
                          return symbol(sym.PRINT_M_M);}
"PART"                   {if(_DEBUG)
                          System.out.println("PART: " + yytext());
                          return symbol(sym.PART);}
"m/s"                    {if(_DEBUG)
                          System.out.println("MS: " + yytext());
                          return symbol(sym.MS);}
"m"                    {if(_DEBUG)
                          System.out.println("M: " + yytext());
                          return symbol(sym.M);}
","                      {if(_DEBUG)
                          System.out.println("CM: " + yytext());
                          return symbol(sym.CM);}
";"                      {if(_DEBUG)
                          System.out.println("S: " + yytext());
                          return symbol(sym.S);}
"{"                      {if(_DEBUG)
                          System.out.println("BO: " + yytext());
                          return symbol(sym.BO);}
"}"                      {if(_DEBUG)
                          System.out.println("BC: " + yytext());
                          return symbol(sym.BC);}
"("                      {if(_DEBUG)
                          System.out.println("RO: " + yytext());
                          return symbol(sym.RO);}
")"                      {if(_DEBUG)
                          System.out.println("RC: " + yytext());
                          return symbol(sym.RC);}
":"                      {if(_DEBUG)
                          System.out.println("C: " + yytext());
                          return symbol(sym.C);}
"="                      {if(_DEBUG)
                          System.out.println("EQ: " + yytext());
                          return symbol(sym.EQ);}
"|"                      {if(_DEBUG)
                          System.out.println("PIPE: " + yytext());
                          return symbol(sym.PIPE);}
"->"                      {if(_DEBUG)
                          System.out.println("ARROW: " + yytext());
                          return symbol(sym.ARROW);}
{cpp_comment}            {;}
{ws}|{nl}                {;}
.                       {System.out.println("SCANNER ERROR: " + yytext());}
