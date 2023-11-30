%{
     #include <stdio.h>
%} 

% token a b c 

%%

S : A B   {
               printf("String accepted!\n");
          };
          
A : 'a' A 'a' {}
     | 'b' B 'b' {}
     | 'c' {}
     ;

B : 'a' B 'b' {}
     | 'a' 'b' {}
     ;

% %

int main()
{
     yyparse();
     return 0;
}

void yyerror(const char *s)
{
     fprintf(stderr, "Error: %s\n", s);
}