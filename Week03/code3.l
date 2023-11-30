/*Q3. Write a lex program to read the input through the keyboard and displaye the number of keywords, identifiers, integers, float in the given input. */
%{
	#include <stdio.h>
	int key=0,line=0,id=0;
	int intc=0,floatc=0;
%}

%%
\n					          {line++;}
[0-9]+[ ,;]				     {intc++;}
[0-9]+\.[0-9]+[ ,;]			     {floatc++;}
int|float|char|for|while|if|else	{key++;}
[a-zA-Z][a-zA-Z0-9_]*			{id++;}
@					          yyterminate();
.					          ;
%%
int main()
{
	yylex();
	printf("Lines: %d\n",line);
	printf("Keywords: %d\n",key);
	printf("Identifiers: %d\n",id);
	printf("Integers: %d\n",intc);
	printf("Floats: %d\n",floatc);
	getchar();
	return 0;
}

int yywrap(void)
{
return 1;
}