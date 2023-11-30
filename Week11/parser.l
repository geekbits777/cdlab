//parser.l
%{
     #include &quot; y.tab.h & quot;
     extern int yylval;
%}

% %

[0 - 9] +      {
                    yylval = atoi(yytext);
                    return DIGIT;
               }

[\t];

\n return 0;

.    return yytext[0];

%%

int yywrap()
{
     return 0;
}