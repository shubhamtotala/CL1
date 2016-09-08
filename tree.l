%{
	#include "y.tab.h"

%}

letter [a-z]*

%%
{letter} {yylval.value = (char)yytext[0]; return id;}


"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
"(" {return '(';}
")" {return ')';}
\n  {return '\n';}

%%

int yywrap(void)
{
	return 0;
}