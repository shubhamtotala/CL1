%{
	#include<stdio.h>

typedef struct node
{
  char data;
  struct node *left, *right;
  char *token;
}node;


#define YYSTYPE struct node*
%}
%union
{
  char val;
}
%token '+' '\n' '*'
%type <value> E
%type <value> T
%type <value> F
%type <value> S
%token <value> id

%%
S : E '\n' {printtree($1);}
  ;
E : E '+' E  {$$ = (*mknode)('+',$1,$3);}
  | T    {$$ = $1;}
  ;
T : T '*' F  {$$ = (*mknode)('*',$1,$3);}
  | F    {$$ = $1;}
  ; 
F : id {$$ = (*mkleaf)($1);}
  | '('E')'    {$$ = $2;}
  ;  
%%

int main (void) 

{return yyparse ( );}

	node *mknode(char *token, node *left, node *right)
{
  node *newnode = (node *)malloc(sizeof(node));
  char *newstr = (char *)malloc(strlen(token)+1);
  strcpy(newstr, token);
  newnode->left = left;
  newnode->right = right;
  newnode->token = newstr;
  return(newnode);
}

void printtree(struct node *root)
{
  printf("%c", root -> data);

  if(root -> left != NULL)
    printf("%c", root -> left);

  if(root -> right != NULL)
    printf("%c", root -> right);
}



void yyerror(char* msg)
{
	printf("error %s",msg);
}
	

