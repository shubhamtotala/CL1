letter [a-zA-Z]  
digit[0-9]  

%% 
{digit}+("E"("+"|"-")?{digit}+)? fprintf(yyout,"\n%s\tis real number",yytext);  
{digit}+"."{digit}+("E"("+"|"-")?{digit}+)? fprintf(yyout,"\n%s\t is floating pt no ",yytext);  
"if"|"else"|"int"|"char"|"scanf"|"printf"|"switch"|"return"|"struct"|"do"|"while"|"void"|"for"|"float" fprintf(yyout,"\n%s\t is keywords",yytext);  
"\n"|"\t" fprintf(yyout,"\n%s\tis Escape sequences",yytext);  
^"#include" fprintf(yyout,"\n%s\t is preprocessor",yytext);
{letter}*".h" fprintf(yyout,"\n%s\t is headerfile",yytext);
{letter}*|({letter}|{digit})* fprintf(yyout,"\n%s\tis variable",yytext);   
"{"|"}"|"["|"]"|"("|")"|"#"|"'"|"."|"\""|"\\"|";"|","|"<"|">" fprintf(yyout,"\n%s\t is a special character",yytext);  
"%d"|"%s"|"%c"|"%f"|"%e" fprintf(yyout,"\n%s\tis a format specifier",yytext);
"//".* fprintf(yyout,"\n%s\tis a single line comment",yytext);   
{letter}({letter}|{digit})*/"(".*");" fprintf(yyout,"\n%s\tis a function",yytext);
"/*"(.|\n)*"*/"  fprintf(yyout,"\n%s\tis a multiline comment",yytext);
{digit}*(.{digit}+)? fprintf(yyout,"\n%s\tis a floating constant",yytext);
"'"{letter}+"'"  fprintf(yyout,"\n%s\tis a character constant",yytext);
\".*\"  fprintf(yyout,"\n%s\tis a string constant",yytext);
"+"|"*"|"/"|"%"|"-" fprintf(yyout,"\n%s\tis a arithmatic operator",yytext);
"="|"!="|"<="|">="|"==" fprintf(yyout,"\n%s\tis a relational operator",yytext);
"&&"|"||" fprintf(yyout,"\n%s\tis a logical operator",yytext);
{letter}({letter}|{digit})*/"["{digit}*"];" fprintf(yyout,"\n%s\tis a array",yytext);


%%
 
int main()  
{  
yyin=fopen("a.txt","r"); 
yyout=fopen("b.txt", "w"); 
yylex();  
fclose(yyin);
fclose(yyout);  
return 0;  
}  
 
