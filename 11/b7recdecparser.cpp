/* The grammar on which recursive descent parser is impelemented

E->E+T|T
T->T*F|F
F->(E)|id

First to eliminate left recursion

E->TE'
E'->+TE'|epsilon
T->FT'
T'->*FT'|epsilon
F->(E) | id

*/

#include<iostream>
#include<string.h>
#include<ctype.h>

using namespace std;

char input[10];
int i,error;
void E();
void T();
void A();
void Tdash();
void F();

int main()
{
	i=0;
	error=0;
	cout<<"Enter the arithmatic expression: ";   //eg. a+a*a;
	cin>>input;
	E();
	if(strlen(input)==i &&(error==0))
		cout<<"\n\nexpression\t"<<input<<"\tString is Accepted !!!\n";
	else
		cout<<"\n\nexpression\t"<<input<<"\tString is not Accepted !!!!\n";	
	return 0;
}

void E()
{
	
	printf("\nE->TA");
	T();
	A();
}


void A()
{

	if(input[i]=='+')
	{
		printf("\nA->+TA");	
		i++;
		T();
		A();
	}
	else
	{
		printf("\nA->epselon");
	}
	

}

void T()
{
	printf("\nT->FB");
	F();
	B();
}


void B()
{
	
	if(input[i]=='*')
	{
		printf("\nB->*FB");
		i++;
		F();
		B();
	}
	else
	{
		printf("\nB->epselon");
	}

}

void F()
{
	if(isalnum(input[i]))
	{
		printf("\nF->I");
			i++;
	}

	else if(input[i]=='(')
	{
		printf("\nF->(E)");
		i++;
		E();
		if(input[i]==')')
		i++;
		else
			error=1;
	}
	else
		error=1;
}


