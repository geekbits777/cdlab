/*Q2. Write a Lex program to read the input from the keyboard and display if the given word is - if, else, int, float, double, for, while. If the input is other than the keyword and it is an integer display it as an integer. If the input is a float display it as a float, if it is and identifier display it as an identifier. Use @ for termination */
%{
	#include <stdio.h>
	#include <string.h>
%}
%%

int|float|char|if|else|while|for	{printf("Keyword: %s\n", yytext);}
[a-zA-Z][a-zA-Z0-9_]*			{printf("Identifer: %s\n", yytext);}
[0-9]+					{printf("Integer: %s\n", yytext);}
[0-9]+.[0-9]+				{printf("Float: %s\n"), yytext;}
@					     yyterminate();
.					     ;
%%

int main()
{
	yylex();
	getchar();
}    

int yywrap()
{
	return 1;
}