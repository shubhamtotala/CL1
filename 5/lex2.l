%{
#include "y.tab.h"
#include<math.h>
%}
digit [a-z]*

%%
{digit}	{yylval.value=yytext[0]; return ID;}
"+" {return '+';}
"=" {return '=';}
\n {return '\n';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}

%%
int yywrap()
{
	return 1;
}
