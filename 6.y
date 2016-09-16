%{
  #include<stdio.h>
  #include<string.h>
  struct node
    {
	char *token;
	struct node *left;
	struct node *right;
    };
struct node *mknode(struct node *, struct node *, char *);
void printtree(struct node *);
struct node *mkleaf(char);
  
%}

%union
{
	char value;
	struct node *ptr;
}
%token '+' '\n' '*' '-' '/'
%token <value> ID
%type <value> S
%type <ptr> E
%type <ptr> T
%type <ptr> F
%left '*' '/'
%left '+' '-'

%%
S : E '\n' { printf("\n Postfix representation of syntax tree is::\t"); printtree($1); printf("\n"); return 0;}
  ;
E : E '+' T  {$$ = mknode($1,$3,"+");}
  | E '-' T  {$$ = mknode($1,$3,"-");}
  | T        {$$ = $1;}
  ;

T : T '*' F  {$$ = mknode($1,$3,"*");}
  | T '/' F  {$$ = mknode($1,$3,"/");}
  | F        {$$ = $1;}
  ;
F : ID {$$=mkleaf($1);}
  | '(' E ')' {$$ = $2;}
  ;

%%

int main()
{
        printf("Enter the expression and press Enter ::");
	yyparse();
	return 0;
}

struct node *mknode(struct node *left, struct node *right, char *token)
{
  
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
  
  struct node *newnode = (struct node *)malloc(sizeof(struct node));
  char *newstr = (char *)malloc(2*sizeof(char));
  newstr[0] = data;
  newstr[1] = '\0';
  newnode->left = NULL;
  newnode->right = NULL;
  newnode->token = newstr;
 
  return(newnode);
}
void printtree(struct node *root)
{
	
        if (root->left != NULL)
		printtree(root->left); 

	if (root->right!= NULL)        
		printtree(root->right);
	
	printf("%s",root->token);

}


/*---------------------------------------------------------------------------------------------
OUTPUT:
swl--14@Comp-SWL-14:~/be56$ lex b6.l
swl--14@Comp-SWL-14:~/be56$ yacc -d b6.y
swl--14@Comp-SWL-14:~/be56$ gcc lex.yy.c y.tab.c -ly
swl--14@Comp-SWL-14:~/be56$ ./a.out
Enter the expression and press Enter ::a+b*c-d/e

 Postfix representation of syntax tree is::	abc*+de/-
*/
