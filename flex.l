%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%%
[ \t\n\r]+      ; // Ignore white spaces

[0-9]+          { printf("Token: %s (Numbers)\n", yytext); }

[a-zA-Z]+       {
    int len = strlen(yytext);
    int isPalindrome = 1;

    for (int i = 0; i < len / 2; i++) {
        if (yytext[i] != yytext[len - 1 - i]) {
            isPalindrome = 0;
            break;
        }
    }

    if (isPalindrome) {
        printf("Token: %s (Palindrome)\n", yytext);
    } else {
        printf("Token: %s (Strings)\n", yytext);
    }
}

[!@#$%^&*()_+{}|:\"<>?`~\-=[\];',./\\]+ { printf("Token: %s (Special Characters)\n", yytext); }
.               { printf("Token: %s (Mixed)\n", yytext); }
%%

int main(int argc, char* argv[]) {
    yylex();
    return 0;
}
