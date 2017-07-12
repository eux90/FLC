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
sep                               = "##"
odd_up                            = [A-Z]{3}([A-Z][A-Z])*
even_dw                           = [a-z]{4}([a-z][a-z])*
rep                               = ("xx"|"xy"|"yx"|"yy"){3}("xx"|"xy"|"yx"|"yy")*
hex                               = [0-9A-Fa-f]{2}|[0-9A-Fa-f]{4}

tk1                               = "="({odd_up}|{even_dw})"?"{rep}?
tk2                               = ({hex}(("."|":"){hex}){2})|({hex}(("."|":"){hex}){4})|({hex}(("."|":"){hex}){7})
email                             = [a-zA-Z0-9_\.]+"@"[a-zA-Z0-9]+"."("it"|"com"|"net")

var                               = [_A-Za-z][a-zA-Z0-9_]+
double                            = (0|[1-9][0-9]*)"."[0-9]*





%%
"##"                              { yybegin(sect2); return plrs(sym.SEP, "SEP"); }
{tk1}                              { return plrs(sym.TK1, "TK1"); }
{tk2}                              { return plrs(sym.TK2, "TK2"); }
{email}                              { return plrs(sym.EMAIL, "EMAIL"); }
"/*" ~ "*/"                       {;}
"//" ~ {nl}                       {;}
";"			                          { return plrs(sym.S, "S"); }
{ws}|{nl}                         {;}
.                                 {System.out.println("SCANNER ERROR: " + yytext());}
<sect2>"="                               { return plrs(sym.EQ, "EQ"); }
<sect2>"*"                               { return plrs(sym.STAR, "STAR"); }
<sect2>"+"                               { return plrs(sym.PLUS, "PLUS"); }
<sect2>"("                               { return plrs(sym.RO, "RO"); }
<sect2>")"                               { return plrs(sym.RC, "RC"); }
<sect2>"["                               { return plrs(sym.SO, "SO"); }
<sect2>"]"                               { return plrs(sym.SC, "SC"); }
<sect2>":"			                          { return plrs(sym.CL, "CL"); }
<sect2>","			                          { return plrs(sym.CM, "CM"); }
<sect2>";"			                          { return plrs(sym.S, "S"); }
<sect2>"DISTANCE"			                          { return plrs(sym.DST, "DST"); }
<sect2>"VALUE"			                          { return plrs(sym.VL, "VL"); }
<sect2>"IN"			                          { return plrs(sym.IN, "IN"); }
<sect2>"WRITE"			                     { return plrs(sym.WR, "WR"); }
<sect2>{var}                      { return plrs(sym.VAR, new String(yytext()), "VAR"); }
<sect2>{double}                   { return plrs(sym.DOUBLE, new Double(yytext()), "DOUBLE"); }
<sect2>\" ~ \"                        { return plrs(sym.QUOT, new String(yytext()), "QUOT"); }
<sect2>"/*" ~ "*/"                       {;}
<sect2>"//" ~ {nl}                       {;}
<sect2>{ws}|{nl}                         {;}
<sect2>.                                 {System.out.println("SCANNER ERROR: " + yytext());}
