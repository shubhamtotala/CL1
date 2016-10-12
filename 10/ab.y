%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(char *);
int yylex(void);

  struct node
  {
    struct node *left;
    struct node *right;
    char *token;
  };

  struct node *mknode(char *token,struct node *left, struct node *right);
  struct node *mkleaf(char data);
  void printtree(struct node *tree);

%}

%union
{
	char val;
	struct node *ptr;
}

%start line

%token  ID
%type <val> ID
%type <ptr> line exp term factor 

%left '*' '/'
%left '+' '-'

%%

line:   exp '\n'     { printtree($1); printf("\n"); return 0;}
    ;

exp    : term             {$$ = $1;}
        | exp '+' term     {$$ = mknode( "+",$1, $3);}
        | exp '-' term    {$$ = mknode("-",$1, $3);}
        ;

term   : factor           {$$ = $1;}
        | term '*' factor  {$$ = mknode("*",$1, $3);}
        | term '/' factor  {$$ = mknode("/",$1, $3);}
        ;

factor : ID           {$$ = mkleaf($1);}
        | '(' exp ')' {$$ = $2;}
        ;
%%

int main (void) 
{
	printf("\n enter expression :: ");
	yyparse ( );
	return 0;
}

struct node *mknode(char *token,struct node *left,struct node *right)
{
  /* malloc the node */
  struct node *newnode = (struct node *)malloc(sizeof(struct node));
  char *newstr = (char *)malloc(strlen(token)+1);
  strcpy(newstr, token);
  newnode->left = left;
  newnode->right = right;
  newnode->token = newstr;
  return(newnode);
}

struct node *mkleaf(char data)
{
  /* malloc the node */
  struct node *newnode = (struct node *)malloc(sizeof(struct node));
  char *newstr = (char *)malloc(2*sizeof(char));
  newstr[0] = data;
  newstr[1] = '\0';
  newnode->left = NULL;
  newnode->right = NULL;
  newnode->token = newstr;
  return(newnode);
}

void printtree(struct node *tree)
{
  printf(" %s ", tree->token);
  if (tree->left)
    printtree(tree->left);
  if (tree->right)
    printtree(tree->right);
}

void yyerror (char *s)
{
	printf ("%s\n", s);
}	
