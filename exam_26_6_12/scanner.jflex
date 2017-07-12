import java_cup.runtime.*;

%%

%class scanner
%unicode
%cup
%standalone
%line
%column
%state first
%state second

%{

  private static final boolean _DEBUG = false;

  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);

  }
%}

nl                                = \n|\r|\r\n
ws                                = " "|\t
hh                                = 00|0[1-9]|1[0-9]|2[0-3]
mm_ss                             = 00|[0-5][1-9]
hour                              = {hh}":"{mm_ss}|{hh}":"{mm_ss}":"{mm_ss}
x_y                               = (X|Y){3}(XX|YY|XY|YX)*
/* even number -138 -- 824 */
even_number                       = ("-"(13[865420]|12[865420]|11[865420]|10[865420]|[1-9][865420]|[86542]))|[865420]|([1-9][865420])|([1-7][0-9][865420])|(8[0-1][865420])|820|822|824
code                              = {x_y}?{even_number}
integer                           = ([1-9][0-9]*|0)
float                             = {integer}"."([0-9][0-9])
string                            = [a-zA-Z]+
numbers                           = [1][2-9]|[2-9][0-9]|1[0-2][0-9]|130|131|132
user_code                         = ([a-zA-Z]{3}([a-zA-Z][a-zA-Z])*)"."({numbers}"."{numbers})("."{numbers}"."{numbers})*
product                           = \" ~ \"

%%

<first>{string}                   {
                                  	if (_DEBUG) System.out.println("STR " + yytext());
                                    return symbol(sym.STR, new String(yytext()));
                                  }
<first>"*****"                    {
                                  	if (_DEBUG) System.out.println("SEP " + yytext());
                                    yybegin(second);
                                    return symbol(sym.SEP);
                                  }

<second>"Auction"                 {
                                  	if (_DEBUG) System.out.println("AUCTION " + yytext());
                                    return symbol(sym.AUCTION);
                                  }
<second>"min"                               {
                                  	if (_DEBUG) System.out.println("MIN " + yytext());
                                    return symbol(sym.MIN);
                                  }
<second>"euro"                               {
                                  	if (_DEBUG) System.out.println("EURO " + yytext());
                                    return symbol(sym.EURO);
                                  }
<second>{integer}                 {
                                  	if (_DEBUG) System.out.println("INT " + yytext());
                                    return symbol(sym.INT, new Integer(yytext()));
                                  }
<second>{product}                 {
                                  	if (_DEBUG) System.out.println("PRD " + yytext());
                                    return symbol(sym.PRD, new String(yytext()));
                                  }
{hour}                               {
                                  	if (_DEBUG) System.out.println("HOUR " + yytext());
                                    return symbol(sym.HOUR);
                                  }
{code}                               {
                                  	if (_DEBUG) System.out.println("CODE " + yytext());
                                    return symbol(sym.CODE);
                                  }
{user_code}                              {
                                  	if (_DEBUG) System.out.println("USRCODE " + yytext());
                                    return symbol(sym.USRCODE, new String(yytext()));
                                  }
{float}                               {
                                  	if (_DEBUG) System.out.println("FLOAT " + yytext());
                                    return symbol(sym.FLOAT, new Float(yytext()));
                                  }
"->"	                         		{
                            				if (_DEBUG) System.out.println("ARROW " + yytext());
                            				return symbol(sym.ARROW);
                          			  }
":"                          			{
                                  	if (_DEBUG) System.out.println("CL " + yytext());
                                  	return symbol(sym.CL);
                                  }
","			                          {
                                  	if (_DEBUG) System.out.println("CM " + yytext());
                                  	return symbol(sym.CM);
                                  }
";"			                          {
                                  	if (_DEBUG) System.out.println("S " + yytext());
                                  	return symbol(sym.S);
                                  }
"*****"                               {
                                  	if (_DEBUG) System.out.println("SEP " + yytext());
                                    yybegin(first);
                                    return symbol(sym.SEP);
                                  }

{ws}|{nl}                         {;}
.                                 {System.out.println("SCANNER ERROR: " + yytext());}
