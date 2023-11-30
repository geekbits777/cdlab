/*Q1. Write a lex program to take the file name as a command line argument and display the number of lines,number of identifiers, in a given input file. An identifier start with an alphabet followed by alphabets, digits or underscores. */0
%{
	#include<stdio.h>
	int line=0;
	int id=0;
%}

%%
\n			          {line++;}
[a-zA-Z][a-zA-Z0-9_]+	{id++;}
.			          {;}
%%
int main(int argc, char* argv[])
{
	if (argc!=2)
	{
		fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
		getchar();
		return 1;
	}

	FILE* input_file=fopen(argv[1], "r");
	if (!input_file)
	{
		perror("Failed to open file");
		return 1;
	}

	yyin=input_file;
	yylex();
	printf("Lines: %d\n", line);
	printf("Identifiers: %d\n", id);
	getchar();
	return 0;
}

int yywrap()
{
	return 1;
}

/* To run this program, navigate to cmd directory and write -
code1.exe input_file.txt */