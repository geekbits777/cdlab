/* Lex prgm to read input and display num of lines words integers. @ is termination */
%{
	#include<stdio.h>
	int l=0, w=0, i=0;
	int id=0;
%}

%%

\n	{l++;}
[0-9]+	{i++;}
[a-zA-Z0-9]+	{w++;}
[a-zA-Z][a-zA-Z0-9_]*	{id++;} /* To check for identifiers */
@	{yyterminate();}
.	{;} /* Reason */

%%

int main()
{
	yylex();
	printf("Lines: %d\n", l);
	printf("Words: %d\n", w);
	printf("Integers: %d\n", i);
	printf("Identifiers: %d\n", id);
	getchar();
	return 0;
}

int yywrap()
{
	return 1;
}