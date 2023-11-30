/* Write a Lex program to read and input text and display the number of vowels, consonants, */
/* digits, and special characters in the given input */

%{
	#include<stdio.h>
	int v=0;
	int c=0;
	int d=0;
	int s=0;
%}

%%
[aeiouAEIOU] {v++;}
[a-zA-Z]	{c++;}
[0-9]	{d++;}
! yyterminate();
.	{s++;}
%%
int main()
{
	yylex();
	printf("Vowels= %d\n", v);
	printf("Consonants= %d\n", c);
	printf("Digits= %d\n", d);
	printf("Special Characters= %d\n", s);
	getchar();
	return 0;

}

int yywrap()
{
	return 1;
}