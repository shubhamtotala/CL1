//Title: Int code generation for sample language using LEX and YACC.
//Batch: B4
//Roll No:


%{
#include "y.tab.h"
#include<math.h>
%}
letter [a-z]*


%%
{letter}	{yylval.value=yytext[0];return ID;}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
"(" {return '(';}
")" {return ')';}
"=" {return '=';}
\n {return '\n';}

%%
