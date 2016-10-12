%{
#include "y.tab.h"
#include<math.h>
%}
digit [0-9]*

%%
{digit}	{yylval.value=atof(yytext);return NUM;}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
"^" {return '^';}
"!" {return '!';}
"(" {return '(';}
")" {return ')';}
sin|SIN {return SIN;}
cos|COS {return COS;}
tan|TAN {return TAN;}
log|LOG {return LOG;}        
sqrt|SQRT {return SQRT;}
square|SQUARE {return SQUARE;}
cube|CUBE {return CUBE;}

\n {return '\n';}

%%
int yywrap()
{
	return 0;
}
