/* Lex prgm to read and input text and display whether a character is consonants vowel digit or special */
%{
	#include<stdio.h>
	int count=0;
%}

%%
[aeiouAEIOU] {printf("It is Vowel\n");}
[a-zA-Z]	{printf("It is Consonant\n");}
[0-9]	{printf("It is digit\n");}
.	{printf("Special character\n");}
%%
int main()
{
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}