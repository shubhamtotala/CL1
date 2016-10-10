%{
#include "y.tab.h"
#include<math.h>
%}
digit [0-9]*

%%
{digit}	{yylval.value=atoi(yytext);return NUM;}
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
sqrt|SQRT {return SQRT;}
sq|SQ {return SQ;}
cube|CUBE {return CUBE;}
\n {return '\n';}

%%
