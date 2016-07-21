 
%{ 
    int count; 
%} 
digit [0-9] 
letter [A-Za-z]

%% 
"$"   {return 0;}
{letter}({letter}|{digit})* count++; 
%% 
int main(void) { 
    yylex(); 
    printf("number of identifiers = %d\n", count); 
    return 0; 
} 

int yywrap()
{
return 1;
}