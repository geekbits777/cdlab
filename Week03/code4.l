/*Q4. Write a lex program to read a binary string and display Accept if the string contains "010" as a substring */
%{
	#include <stdio.h>
%}
%%

[01]*010[01]*	{printf("Accepted\n");}
[01]*		{printf("Rejected\n");}
.		     {printf("Invalid String\n"); yyterminate();}
%%

int main()
{
	yylex();
	getchar();
	return 0;
}

int yywrap()
{
	return 1;
}