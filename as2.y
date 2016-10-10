%{
 #include<stdio.h>
#include"y.tab.h"
#include <math.h>
#define PI 3.141592
int i,j;
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
%token SIN COS TAN SQRT SQUARE MOD CUBE FACT
%left LN LOG

%%
L:S L
 | 
 ;
S: E '\n' {printf("%d\n",$1);}
 ;
E: E '+' E           {$$= $1+$3;}
 | E '-' E           {$$=$1-$3;}
 | E '*' E 	     {$$=$1*$3;}
 | E '/' E	     {$$=$1/$3;}
 | E '^' E           {$$=pow($1,$3);}
 | SIN '(' E ')'     {$$=sin($3/180*PI);}
 | COS '(' E ')'     {$$=cos($3/180*PI);}
 | SQRT '(' E ')'    {$$=sqrt($3);}
 | SQUARE '(' E ')'  {$$=$3*$3;}
 | CUBE '(' E ')'    {$$=$3*$3*$3;}
 | FACT '(' E ')'    {$$=1; for(j=1;j<=$3;j++) $$=$$*j;}
 | MOD '(' E','E')'  {$$=fmod($3,$5);}
 | num 		     {$$=$1;}
 ;

%%
 
int main()
{
        printf("Enter the expression and press Enter");
	yyparse();
	return 0;
}
