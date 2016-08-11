%{
	#include<stdio.h>
	#include<math.h>
%}
%union
{
	int value;
}

%token '+' '\n'
%token <value> num
%type <value> S
%type <value> E
%left '+' '-'
%left '*' '/'

%%
S : E '\n' {printf("%d\n",$1); return 0; }
  ;
E : E '+' E  {$$ = $1 + $3;}
  | num    {$$ = $1;}
  ;
E : E '-' E  {$$ = $1 - $3;}
  | num    {$$ = $1;}
  ; 
E : E '*' E  {$$ = $1 * $3;}
  | num    {$$ = $1;}
  ;
E : E '/' E  {$$ = $1 / $3;}
  | num    {$$ = $1;}
  ;  
%%

int main()
{
	yyparse();
	return 0;
}

void yyerror(char* msg)
{
	printf("error %s",msg);
}
	

