%{
	#include "y.tab.h"
	#include<math.h>

%}

digit[0-9]*

%%
{digit} {yylval.value = atoi(yytext);return num;}

"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}

%%

int yywrap()
{
	return 0;
}