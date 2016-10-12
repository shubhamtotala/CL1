%{
#include"y.tab.h"
#include<math.h>
%}

digit[0-9]*
%%
{digit} {yylval.value=atoi(yytext); return NUM;}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"(" {return '(';}
")" {return ')';}
\n {return '\n';}
sin|SIN {return SIN;}    
"cos" {return 'COS';}    
"tan" {return TAN;}        
"log" {return LOG;}        
"sqrt" {return SQRT;}   

%%
int yywrap()
{
return 1;
}
