%{
	#include "y.tab.h"
	

%}

letter [a-z]*

%%
{letter} {yylval.value =yytext[0];  return ID;}

"+" {return '+';}
"-" {return '-';}
"/" {return '/';}
"*" {return '*';}
"\n"  {return '\n';}

%%

int yywrap()
{
	return 1;
}
