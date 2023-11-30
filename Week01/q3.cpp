// Write a program to take the input as a file name, and display the number of lines, no. of words, no. of digits, no. of vowels and consonants.
#include <bits/stdc++.h>
using namespace std;

int main()
{
     string fileName;
     cin>>fileName;
     int l=0, w=0, let=0;
     int d=0, vow=0, con=0;

     ifstream inputFile(fileName);
     if (!inputFile)
     {
          cout<<"File not found!"<<endl;
          
          return 0;
     }

     string line;
     string content="";
     while (getline(inputFile, line))
     {
          content+=line+'\n';
     }

     for (char c:content)
     {
          if (c=='\n')
          {
               l++;
          }
          else if (isspace(c))
          {
               w++;
          }

          if (isalpha(c))
          {
               let++;
               if (c=='a' || c=='e' || c=='i' || c=='o' || c=='u' || c=='A' || c=='E' || c=='I' || c=='O' || c=='U')
                    vow++;
               else
                    con++;
          }
          else if (isdigit(c))
          {
               d++;
          }
     }

     w++;

     cout<<"Lines: "<<l <<endl;
     cout<<"Words: "<<w <<endl;
     cout<<"Digits: "<<d <<endl;
     cout<<"Vowels: "<<vow <<endl;
     cout<<"Consonants: "<<con;

     return 0;
}