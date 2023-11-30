//Write a program that accepts binary string having even numbers of 0 and 1s.
#include <bits/stdc++.h>
using namespace std;

int main()
{
     string x;
     cin>>x;
     int a=0, b=0;

     for (int i=0; i<x.length(); i++)
     {
          if (x[i]=='0')
          {
               a++;
          }
          else if (x[i]=='1')
          {
               b++;
          }
          else
          {
               cout<<"Invalid";    
               break;
          }
     }

     if (a%2==0 && b%2==0)
          cout<<"Accepted";
     else
          cout<<"Rejected";

     return 0;
}