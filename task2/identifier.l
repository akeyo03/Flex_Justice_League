%{
#include <stdio.h>
%}
%option noyywrap
%%

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Valid identifier: %s\n", yytext);
}

.|\n {
    printf("Invalid identifier: %s\n", yytext);
}

%%
int main(int argc, char* argv[]) {
    yylex();

    return 0;
}