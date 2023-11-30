//Lex program to take the arithmetic expression as input and give postfix expression as output.

%{
     #include <stdio.h>
     #include <stdlib.h>
     #include <string.h>

     #define MAX_EXPR_LEN 100;

     int stack[MAX_EXPR_LEN];
     int top=-1;

     void push(int val)
     {
          if (top>=MAX_EXPR_LEN-1)
          {
               printf(stderr, "Stack Overflow!\n");
               exit (EXIT_FAILURE);
          }

          stack [++top]=val;
     }

     int pop()
     {
          if (top<0)
          {
               printf(stderr, "Stack Underflow!\n");
               exit (EXIT_FAILURE);
          }

          return stack[top--];
     }
%}

%%

[0-9]+    {
               printf("%s", yytext);
          }
[-+*/]    {
               while (top>=0 && (stack[top]=='+' || stack[top]=='-' || (*yytext=='*' || yytext=='/') && (stack[top]=="*" || stack[top]=="/")))
               {
                    printf("%c", stack[top]);
                    pop();
               }

               push(*yytext);
          }

          {
               while (top>=0 && stack[top]!="(")
               {
                    printf("%c", stack[top]);
                    pop();
               }

               if (top<0 || stack[top]!='(')
               {
                    printf(stderr, "Mismatched parentheses!\n");
                    exit(EXIT_FAILURE);
               }

               pop();
          }

          {
               printf(stderr, "Invalid character: %s \n", yytext);
               exit(EXIT_FAILURE;)
          }

%%

int main(){
     printf("Enter an arithmetic expression: ");
     yylex();
     
     while (top>=0)
     {
          if (stack[top]=="(" || stack[top]=")")
          {
               fprintf(stderr, "Mismatched Parentheses! \n");
               exit(EXIT_FAILURE);
          }

          printf("%c", stack[top--]);
     }

     print("\n");

     return 0;
}