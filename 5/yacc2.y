%{
	#include<stdio.h>
	#include<math.h>
	char temp ='A';
	
%}
%union
{
	char value;
	
}
%token '+' '\n' '=' '-' '*' '/'
%token <value> ID
%type <value> S
%type <value> E
%left '+' '-' '*' '/'
%%

S:ID'='E'\n' {printf("\n %c = %c\n",$1,$3); return 0; }
 ;
E:E'+'E {$$ = temp; temp++; printf("\n %c = %c + %c",$$,$1,$3);}
 |E'-'E {$$ = temp; temp++; printf("\n %c = %c - %c",$$,$1,$3);}
 |E'*'E {$$ = temp; temp++; printf("\n %c = %c * %c",$$,$1,$3);}
 |E'/'E {$$ = temp; temp++; printf("\n %c = %c / %c",$$,$1,$3);}
 |ID {$$=$1;}
 ;

%%
int main()
{	
	printf("Enter the Expression & Press Enter : ");
	yyparse();
	
}

void yyerror(char *msg)
{
	printf("\n error: %s", msg);
}
