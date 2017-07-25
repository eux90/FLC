import java_cup.runtime.*;

%%

%class scanner
%unicode
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

list              = mp3_list
server            = server
data              = data
time              = time
word              = [A-Za-z_][A-Za-z0-9_]*
file              = {word}(\.mp3|\.MP3)
bitrate           = Kb\/s
integer           = ([1-9][0-9]*|0)
dd                = [0][1-9]|[1-2][0-9]|[3][0-1]
mm                = [0][1-9]|[1][0-2]
yyyy              = [2][0-9][0-9][0-9]
h                 = [0-1][0-9]|[2][0-3]
m                 = [0-5][0-9]
ip_section        = [0-9]|1[0-9]|1[0-9][0-9]|2[0-5][0-5]
date_stamp        = {dd}\/{mm}\/{yyyy}
time_stamp        = {h}\:{m}
ip                = {ip_section}\.{ip_section}\.{ip_section}\.{ip_section}
nl                = \r|\n|\r\n
ws                = [ \t]


%%
{list}                  {if(_DEBUG)
                          System.out.println("LIST: " + yytext());
                          return symbol(sym.LIST);}
{server}                {if(_DEBUG)
                          System.out.println("SERVER: " + yytext());
                          return symbol(sym.SERVER);}
{data}                  {if(_DEBUG)
                          System.out.println("DATA: " + yytext());
                          return symbol(sym.DATA);}
{time}                  {if(_DEBUG)
                          System.out.println("TIME: " + yytext());
                          return symbol(sym.TIME);}
{file}                  {if(_DEBUG)
                          System.out.println("FILE: " + yytext());
                          return symbol(sym.FILE, new String(yytext()));}
{bitrate}               {if(_DEBUG)
                          System.out.println("BITRATE: " + yytext());
                          return symbol(sym.BITRATE);}
{date_stamp}            {if(_DEBUG)
                          System.out.println("DATE STAMP: " + yytext());
                          return symbol(sym.DATE_STAMP);}
{time_stamp}            {if(_DEBUG)
                          System.out.println("TIME STAMP: " + yytext());
                          return symbol(sym.TIME_STAMP);}
{ip}                    {if(_DEBUG)
                          System.out.println("IP: " + yytext());
                          return symbol(sym.IP, new String(yytext()));}
{integer}               {if(_DEBUG)
                          System.out.println("INT: " + yytext());
                          return symbol(sym.INT, new Integer(yytext()));}
","                     {if(_DEBUG)
                          System.out.println("CM: " + yytext());
                          return symbol(sym.CM);}
":"                     {if(_DEBUG)
                          System.out.println("C: " + yytext());
                          return symbol(sym.C);}
";"                     {if(_DEBUG)
                          System.out.println("S: " + yytext());
                          return symbol(sym.S);}
{ws}|{nl}               {;}
.                       {System.out.println("SCANNER ERROR: " + yytext());}
