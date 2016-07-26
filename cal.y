%{
	#include<stdio.h>

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
S : E '\n' {printf("%d",$1);}
  ;
E : E '+' E  {$$ = $1 + $3;}
  | num    {$$ = $1;}
  ;

%%

int main()
{
	yyparse();
}
	

}
	

