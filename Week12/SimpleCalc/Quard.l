//Simple Calculator - Quard.l

%{
     #include "y.tab.h"
     extern int yylex();
     extern void yyerror(const char *s);
%}

%%

[0 - 9]+       {
                    yylval.num = atoi(yytext);
               
                    return NUMBER;
               }

[-+* / ()]+    {
                    return yytext[0];
               }

[ \t\n];
. { yyerror("Invalid character"); }
% %


