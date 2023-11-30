/*
FIRST and FOLLOW

Sample Input:
3
S>aSa
S>bSb
S>c

The output
FIRST(S) = { a,b,c}

The expected output of FOLLOW(S)={$,a,b}
*/

#include <stdio.h>
#include <ctype.h>
#include <string.h>

void FIRST(char *, char);
void addToArray(char *, char);
void printArray(char *);
void FOLLOW(char *result, char c);

int n;
char production[20][20];

main()
{
     int i, j = 0, k, foundNt = 0;
     char c, result[20], nt[20];
     nt[0] = '\0';
     printf("Enter number of productions :");
     scanf(" %d", &n);
     
     for (i = 0; i < n; i++)
     {
          printf("Enter productions Number %d : ", i + 1);
          scanf(" %s", production[i]);

          addToArray(nt, production[i][0]);
     }

     for (k = 0; nt[k] != '\0'; k++)
     {
          c = nt[k];
          FIRST(result, c);
          printf("\n FIRST(%c)= { ", c);
          printArray(result);
          printf("}\n");
          getchar();
     }

     for (k = 0; nt[k] != '\0'; k++)
     {
          c = nt[k];
          FOLLOW(result, c);
          printf("\n FOLLOW(%c)= { ", c);
          printArray(result);
          printf("}\n");
     }
}

void FIRST(char *Result, char c)
{
     int i, j, k;
     char subResult[20];
     int foundEpsilon;
     subResult[0] = '\0';
     Result[0] = '\0';

     if (!(isupper(c)))
          addToArray(Result, c);
     else
          for (i = 0; i < n; i++)
          {
               if (production[i][0] == c)
               {
                    if (production[i][2] == '^')
                         addToArray(Result, '^');
                    else
                    {
                         for (j = 2; production[i][j] != '\0'; j++)
                         {
                              foundEpsilon = 0;
                              FIRST(subResult, production[i][j]);

                              for (k = 0; subResult[k] != '\0'; k++)
                                   if (subResult[k] == '^')
                                        foundEpsilon = 1;
                                   else
                                        addToArray(Result, subResult[k]);
                              if (!foundEpsilon)
                                   break;
                         }
                    }
               }
          }
     return;
}

void addToArray(char *Result, char val)
{
     int k;
     for (k = 0; Result[k] != '\0'; k++)
          if (Result[k] == val)
               return;
     Result[k] = val;
     Result[k + 1] = '\0';
}
void printArray(char *a)
{
     int i = 0;
     for (i = 0; a[i] != '\0'; i++)
          printf(" %c ", a[i]);
}
void FOLLOW(char *result, char c)
{
     int i, j, k, t, foundEpsilon = 0;
     char subResult[20];
     result[0] = '\0';
     if (c == production[0][0])
          addToArray(result, '$');
     for (i = 0; i < n; i++)
     {
          int l = strlen(production[i]);
          printf("\nLength of production = %d Rule 2 \n", l);
          printArray(result);
          for (j = 2; j < l - 1; j++)
          {
               foundEpsilon = 0;
               if (production[i][j] == c)
               {
                    for (k = j + 1; k < l - 1; k++)
                    {
                         subResult[0] = '\0';
                         foundEpsilon = 0;
                         FIRST(subResult, production[i][k]);
                         for (t = 0; subResult[t] != '\0'; t++)
                              if (subResult[t] == '^')
                                   foundEpsilon = 1;
                              else
                                   addToArray(result, subResult[t]);
                         if (!foundEpsilon)
                              break;
                    }
               }
          }
     }
}