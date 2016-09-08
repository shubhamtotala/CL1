%{
	#include<stdio.h>
	#include<math.h> 
	int yylex(void); 
	void yyerror(char *s); 
	char temp='A';
	          
%}
%union
{
	char value;
}
%token '+' '\n' '=' '-' '*' '/' 
%token <value> NUM
%type <value> S
%token <value> ID
%type <value> E
%left '+' '-'
%left '*' '/'


%%	
S:ID '=' E '\n'	{printf("%c = %c \n",$1,$3);return 0;}
 ;
E:E'+'E 		{$$ = temp; temp++; printf("%c=%c+%c\n",$$,$1,$3);}
E:E'-'E 		{$$ = temp; temp++; printf("%c=%c-%c\n",$$,$1,$3);}
E:E'*'E 		{$$ = temp; temp++; printf("%c=%c*%c\n",$$,$1,$3);}
E:E'/'E 		{$$ = temp; temp++; printf("%c=%c/%c\n",$$,$1,$3);}
E:'('E')'		{$$ = temp; temp++; $2;}
 |ID 			{$$=$1;}
 ;
%%
int main()
{	
	yyparse();
	
}

void yyerror(char* msg)
{
	printf("error %s",msg);
}

/* 	OUTPUT
a=(b)
a = A 	*/