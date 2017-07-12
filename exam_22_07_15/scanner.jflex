import java_cup.runtime.*;

%%

%class scanner
%unicode
%cup
%standalone
%line
%column
%state prog

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

token1                            = ((11":"(3[5-9]|4[0-9]|5[0-9]))|(12":"([0-5][0-9])))("am")?|((13":"([0-4][0-9]|50|51)))|((01":"([0-4][0-9]|50|51)))"pm"
string                            = \" ~ \"
iptoken                           = [0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]
ipaddress                         = ({iptoken}.){3}{iptoken}
token2                            = {string}":"{ipaddress}
odd_number                        = ("-"(3[135]|[2-1][97531]|[97531]))|([13579]|[1-9][13579]|[1][0-9][13579]|2[0-4][13579]|25[13])
ended                             = "Y""X"("XX")*"Y"|"****"("*")*
token3                            = "%"[a-zA-Z]{4}([a-zA-Z][a-zA-Z])*{odd_number}{ended}?
integer                           = (0|[1-9][0-9]*)
variable                          = [a-zA-Z_][a-zA-Z0-9_]*



%%
{token1}                           { return plrs(sym.TK1, "TK1"); }
{token2}                           { return plrs(sym.TK2, "TK2"); }
{token3}                           { return plrs(sym.TK3, "TK3"); }
"##"                               { yybegin(prog); return plrs(sym.SEP, "SEP"); }
<prog>"&&"                         { return plrs(sym.AND, "AND"); }
<prog>"||"                         { return plrs(sym.OR, "OR"); }
<prog>"!"                          { return plrs(sym.NOT, "NOT"); }
<prog>"=="                         { return plrs(sym.EQUAL, "EQUAL"); }
<prog>"="                          { return plrs(sym.EQ, "EQ"); }
<prog>"+"                          { return plrs(sym.PLUS, "PLUS"); }
<prog>"*"                          { return plrs(sym.STAR, "STAR"); }
<prog>"-"                          { return plrs(sym.MINUS, "MINUS"); }
<prog>"("                          { return plrs(sym.RO, "RO"); }
<prog>")"                          { return plrs(sym.RC, "RC"); }
<prog>"["                          { return plrs(sym.SO, "SO"); }
<prog>"]"                          { return plrs(sym.SC, "SC"); }
<prog>"TRUE"                       { return plrs(sym.TRUE, new Boolean(true), "TRUE"); }
<prog>"FALSE"                      { return plrs(sym.FALSE, new Boolean(false), "FALSE"); }
<prog>"EVALUATE"                   { return plrs(sym.EV, "EV"); }
<prog>"CASE_FALSE"                 { return plrs(sym.CF, "CF"); }
<prog>"CASE_TRUE"                  { return plrs(sym.CT, "CT"); }
<prog>"SAVE"                       { return plrs(sym.SV, "SV"); }
<prog>","			                     { return plrs(sym.CM, "CM"); }
<prog>{integer}                    { return plrs(sym.INT, new Integer(yytext()), "INT"); }
<prog>{variable}                   { return plrs(sym.VAR, new String(yytext()), "VAR"); }
";"			                           { return plrs(sym.S, "S"); }
"/*" ~ "*/"                        {;}
{ws}|{nl}                          {;}
.                                  {System.out.println("SCANNER ERROR: " + yytext());}
