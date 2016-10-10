%{
#include"y.tab.h"
#include <math.h>
%}
digit[0-9]*
%%
{digit}  {yylval.value=atoi(yytext); return num;}
"+" {return '+';}
"*" {return '*';}
"/" {return '/';}
"-" {return '-';}
sin|SIN {return SIN;}
cos|COS {return COS;}
sqrt|SQRT {return SQRT;}
square|SQUARE {return SQUARE;}
cube|CUBE {return CUBE;}
fact|FACT {return FACT;}
MOD|mod {return MOD;}
"^" {return '^';}
"\n" {return '\n';}
"(" {return '(';}
")" {return ')';}
"," {return ',';}
%%
int yywrap()
{
return 0;
}
