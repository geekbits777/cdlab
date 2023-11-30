// AIM:To write a C program to implement simple code optimization technique.

#include <stdio.h>

int main()
{
     int item = 10;
     int value = 0;
     int f1, f2;
     
     // Initial code
     /*
     do {
     item = 10; value =
     value + item;
     } while (value < 100);
     */

     int temp = 10;
     f1 = temp;
     f2 = value + f1;

     if (f1 == 0 && f2 == 0)
     {
          printf("Expression could not be optimized.\n");
     }
     else
     {
          printf("Optimized expression: value = value + %d\n", f1);
     }

     return 0;
}

/* OUTPUT:
Optimized expression: value=value+10
*/