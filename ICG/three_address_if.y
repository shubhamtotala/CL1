%{
 #include<stdio.h>
 #include<stdlib.h>
 #include<string.h>
 typedef struct intercode
 {
  char optor;
  char op1[10];
  char op2[10];
  char res[10];
 }intercode;
 intercode ic_if[50],ic_else[50];		 
 int allrows,temp=1,cnt_if=0;
char goto_if[]="goto L0\0",goto_else[]="goto L1\0";
%}

%union
{
int no;
char str[10];
}

%token <str> if_id
%token <str> else_id
%token <str> rel_op
%token <str> brace_cls
%token <str> brace_op
%token <str> para_op
%token <str> para_cls
%token <str> id
%token <no> digit
%type <str> expr


%left '+' '-'
%left '*' '/' 
%nonassoc '='

%%
start : if_id para_op id rel_op id para_cls brace_op start {}
| '$'   {exit(0); }
| id '=' expr ';'{ emit_if('=',$3,"",$1); yyparse();}
|brace_cls{printf("goto L0 \n goto L1"); 
int i=0;
                printf("\n \t L0 :\t" );
                for(i=0;i<cnt_if;i++)
{
printf("%c",ic_if[i].optor);
printf("\t\t %s",ic_if[i].op1);
printf("\t\t %s",ic_if[i].op2);
printf("\t\t %s\n\t\t",ic_if[i].res);
}
yyparse();

}
      ;

expr : expr'+'expr {sprintf($$,"t%d",temp); temp++; emit_if('+',$1,$3,$$);}
     | expr'-'expr {sprintf($$,"t%d",temp); temp++; emit_if('-',$1,$3,$$);}
     | expr'*'expr {sprintf($$,"t%d",temp); temp++; emit_if('*',$1,$3,$$);}
     | expr'/'expr {sprintf($$,"t%d",temp); temp++; emit_if('/',$1,$3,$$);}
     |id {}
     |digit{}
     ;
%%
main()
{
yyparse();
return 0;
}

void emit_if(char opr,char *op1, char *op2,char *res)
{
 ic_if[cnt_if].optor=opr;
 strcpy(ic_if[cnt_if].op1,op1);
 strcpy(ic_if[cnt_if].op2,op2);
 strcpy(ic_if[cnt_if].res,res);
 cnt_if++;
}


