letter	[a-zA-z]
digit	[0-9]
%{
%}

%%

[0-9]* 													{printf("\n%s:It is a integer:",yytext);}
int|float|char|double 									{printf("\n%s:It is a data type", yytext);}
"("|"<"|"["|"{" 										{printf("\n%s:Opening brackets", yytext);}
")"|">"|"}"|"}"	 										{printf("\n%s:Closing brackets\n", yytext);}
";"|"," 												{printf("\n%s:Delimeters", yytext);}
main|switch|case|break|continue|default|printf|scanf 	{printf("\n%s:Keyword\n", yytext);}
{letter}|{letter}{digit} 								{printf("\n%s:Variable\n", yytext);}
"="|"+"|"-"|"*" 										{printf("\n%s:Operator\n", yytext);}
"#include" 												{printf("\n%s:Preprocessor\n", yytext);}
{letter}*.h 											{printf("\n%s:Header File\n", yytext);}
"<="|">"|"<"|">=" 										{printf("\n%s:Relational Operator", yytext);}
TRUE|FALSE 												{printf("\n%s:Boolean Operator", yytext);}
if|for|while|do 										{printf("\n%s,Loops", yytext)}
"&&"|"||"												{printf("\n%s,Logical Operator", yytext);}

%%

int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
}	