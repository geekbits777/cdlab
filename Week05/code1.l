/* 1. Write a lex prgm to take the file name as an input and display keyword if the lexime is int, float, char, double, void, return.
/* If the lexime start with a letter followed by letter/digit klein clousre, display it as an identifier. If the lexime is an id, then insert it into the symbol table if it is not existing in the symbol table. If the lexime is an integer display it and an integer, if the lexime is an floating point display it as floating point. In the above process discard the single line comments (//...) and multiline comments (/* ... */)
digit [0-9]+
id [a-zA-Z][a-zA-Z0-9]*
num digit+\.digit+

%{
	#include<stdio.h>
	#include<string.h>
	int cnt=0, i=0, j=0;
	int sc=0, comm=0;
	char st[100][20];
	int look_up(char st[100][20], char *id, int n);
%}

%%
\/\/					{comm=1; sc=1;}
\/\*					{comm=1;}
\*\/					{comm=0;}
\n					{
						if(sc==1)
						{
							comm=0;
							sc=0;
						}
					}
int|float|char|double|void|return	{	if(comm==0)
						{
							printf("%s is Keyword\n",yytext);
						}
					}
{id}					{	if(comm==0)
						{
							printf("%s is Identifier\n",yytext);
							cnt++;
							if (!look_up(st, yytext, i))
							strcpy(st[i++], yytext);
						}
					}

%%

main()
{
	FILE *fp;
	char ip[10];
	printf("\nEnter the file name: \n");
	scanf("%s",ip);
	printf("\nThe file you entered is: %s\n", ip);
	getchar();

	fp=fopen(ip,"r");
	if(fp==NULL)
	{
		printf("File does not exist.\n");
		getchar();
		exit(0);
	}
	else
	{
		yyin=fp;
		yylex();
		fclose(fp);
		printf("\nThe contents of the symbol table are:\n");
		for (j=0; j<i; j++)
		{
			printf("\n%s", st[j]);
			printf("\n\n");
		}
	}
	
	getchar();
	return 0;
}

int yywrap()
{
	return 1;
}

int look_up(char st[100][20], char *id, int n)
{
	for (j=0; j<n; j++)
	{
		if (!strcmp(st[j], id))
		{
			return 1;
		}
	}

	return 0;
}