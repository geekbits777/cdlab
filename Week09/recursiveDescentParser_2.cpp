/*
Recursive Descent Parser

S-->aSa
S-->bSb
S-->c
*/

#include <stdio.h>
#include <string.h>
int S();
int match(char);
char *ip;
char string[50];

int main()
{
     printf("Enter the string\n");
     scanf("%s", string);
     ip = string;
     printf("\n\nInput\tAction\n--------------------------------\n");
     if (S() && *ip == '\0')
     {
          printf("\n--------------------------------\n");
          printf("String is successfully parsed\n");
     }

     else
     {
          printf("\n--------------------------------\n");
          printf("Error in parsing String\n");
     }
     return 0;
}
int S()
{
     printf("%s\tS->aSa | bSb | c \n", ip);
     if (*ip == 'a')
     {
          ip++;
          if (S() && match('a'))
          {
               return 1;
          }
          else
               return 0;
     }
     else if (*ip == 'b')
     {
          ip++;
          if (S() && match('b'))

          {
               return 1;
          }
          else
               return 0;
     }
     else if (*ip == 'c')
     {
          printf("%s\tS->c \n", ip);
          ip++;
          return 1;
     }
     else
          return 0;
}
int match(char symbol)
{
     if (*ip == symbol)
     {
          ip++;
          return 1;
     }
     else
          return 0;
}