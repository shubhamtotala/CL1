%{
	#include "y.tab.h"
	#include<math.h>

%}

digit [0-9]*

%%
{digit} {yylval.value = atoi(yytext);return num;}

"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
\n  {return '\n';}

%%

int yywrap(void)
{
	return 0;
}