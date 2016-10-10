%{
	#include<stdio.h>
	#include<math.h>
	#define PI 3.141592
	#define p 1000000
%}
%union
{
	float value;
}
%token '+' '\n'
%token <value> NUM
%token SIN COS TAN SQRT SQ CUBE 
%type <value> S
%type <value> E
%type <value> L
%left '+' '-'
%left '*' '/'
%right '^'

%%
L:S L
 | {printf("\n");}
 ;
S:E '\n' {int i=$1;float j=$1;if((j*p)>(i*p)) printf("%f\n",$1);else{int i=$1; printf("%d\n",i);}}
 ;
E:E'+'E {$$=$1 + $3;}
 |E'-'E {$$=$1 - $3;}
 |E'*'E {$$=$1 * $3;}
 |E'/'E {if($3==0)printf("Divided by zero Not allowed !!");else $$=$1 / $3;}
 |'('E')' {$$=$2;}
 |E'^'E {$$=pow($1,$3);}
 |SIN'('E')' {$$=sin(($3/180)*PI);}
 |COS'('E')' {$$=cos(($3/180)*PI);}
 |TAN'('E')' {if($3==90)printf("Output is Undefined !!");else $$=tan(($3/180)*PI);}
 |SQRT'('E')' {$$=sqrt($3);}
 |SQ'('E')' {$$=$3*$3;}
 |CUBE'('E')' {$$=$3*$3*$3;}
 |E'!' {int i,j=1;for(i=1;i<=$1;i++){j=j*i;}$$=j;}
 |NUM {$$=$1;}
 ;

%%
int main()
{	
	printf("Enter the Expression & Press Enter : \n");
	yyparse();
	
}
