%{
	#include<stdio.h>
	#include<math.h>
	#define PI 3.1415
%}
%union
{
	float value;
}
%token '+' '\n'
%token <value> NUM
%token SIN COS TAN SQRT SQUARE CUBE 
%type <value> S
%type <value> E
%type <value> L
%left '+' '-'
%left '*' '/'
%right '^'

%%
L:S L
 |
 ;
S:E '\n' {printf("%f\n",$1);}
 ;
E:E'+'E {$$=$1 + $3;}
 |E'-'E {$$=$1 - $3;}
 |E'*'E {$$=$1 * $3;}
 |E'/'E {$$=$1 / $3;}
 |'('E')' {$$=$2;}
 |E'^'E {
	int i,j=$1;
	for(i=1;i<$3;i++)
	{
		j=j*$1;
	}
	$$=j;}
 |E'!' {
	int i,j=1;
	for(i=1;i<=$1;i++)
	{
		j=j*i;
	}$$=j;}
 |SIN'('E')' {$$=sin($3/180*PI);}
 |COS'('E')' {$$=cos($3/180*PI);}
 |TAN'('E')' {$$=tan($3/180*PI);}
 |SQRT'('E')' {$$=sqrt($3);}
 |SQUARE'('E')' {$$=$3*$3;}
 |CUBE'('E')' {$$=$3*$3*$3;}
 |NUM {$$=$1;}
 ;

%%
int main()
{	
	printf("Enter the Expression & Press Enter : ");
	yyparse();
	
}
