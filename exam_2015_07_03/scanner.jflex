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
sep                               = "$$$"("$$")*
tk_number                         = ("-"(1|2|3))|([0-9]|[1-9][1-9]|1[0-1][0-9]|120|121|122|123)
tk_word                           = [a-zA-Z]{4}([a-zA-Z][a-zA-Z])*
tk_end                            = "IJK"|"XY"|"XYZ"("ZZ")*
code1                             = "#"{tk_word}{tk_number}{tk_end}?
hex                               = [0-9a-fA-F]
hex_num                           = {hex}{hex}|{hex}{hex}{hex}{hex}
code2                             = ({hex_num}(":"|"-"){hex_num})((":"|"-")({hex_num}(":"|"-"){hex_num}))*
integer                           = (0|[1-9][0-9]*)
float                             = {integer}"."[0-9]+

%%

{code1}                           { return plrs(sym.CD1, "CD1"); }
{code2}                           { return plrs(sym.CD2, "CD2"); }
";"			                          { return plrs(sym.S, "S"); }
{sep}                             { yybegin(sect2); return plrs(sym.SEP, "SEP"); }
"//" ~ {nl}                         {;}
{ws}|{nl}                         {;}
.                                 {System.out.println("SCANNER ERROR: " + yytext());}
<sect2>"OXYGEN"	                        { return plrs(sym.OX, "OX"); }
<sect2>"CELLS"	                          { return plrs(sym.CLS, "CLS"); }
<sect2>";"			                          { return plrs(sym.S, "S"); }
<sect2>"MOD_STATE1"	                    { return plrs(sym.M1, "M1"); }
<sect2>"MOD_STATE2"	                    { return plrs(sym.M2, "M2"); }
<sect2>"MAX"	                            { return plrs(sym.MAX, "MAX"); }
<sect2>"TEMP"	                          { return plrs(sym.T, "T"); }
<sect2>"FOOD"	                          { return plrs(sym.F, "F"); }
<sect2>"+"                               { return plrs(sym.PLUS, "PLUS"); }
<sect2>"-"                               { return plrs(sym.MINUS, "MINUS"); }
<sect2>"("                               { return plrs(sym.RO, "RO"); }
<sect2>")"                               { return plrs(sym.RC, "RC"); }
<sect2>","			                          { return plrs(sym.CM, "CM"); }
<sect2>":"                          			{ return plrs(sym.CL, "CL"); }
<sect2>{integer}                         { return plrs(sym.INT, new Integer(yytext()), "INT"); }
<sect2>{float}                           { return plrs(sym.FLOAT, new Float(yytext()), "FLOAT"); }
<sect2>{ws}|{nl}                         {;}
<sect2>"//" ~ {nl}                         {;}
<sect2>.                                 {System.out.println("SCANNER ERROR: " + yytext());}
