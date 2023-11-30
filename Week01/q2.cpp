//Write a program to accept the binary strings consisting "101011" as a substring.
#include <bits/stdc++.h>
using namespace std;

int main()
{
     string x;
     cin>>x;
     int flag=0;

     for (int i=0; i<x.length(); i++)
     {
          if (x[i]=='1')
               if (x[i+1]=='0')
                    if (x[i+2]=='1')
                         if (x[i+3]=='0')
                              if (x[i+4]=='1')
                                   if (x[i+5]=='1')
                                   {
                                        cout<<"Accepted";
                                        flag++;
                                        break;
                                   }
          
          if (x[i]!='0' && x[i]!='1')
          {
               cout<<"Invalid Input"<<endl;
               return 0;
          }
     }

     if (flag==0)
          cout<<"Rejected";

     return 0;
}