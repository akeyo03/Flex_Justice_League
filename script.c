#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void tokenizeSentence(char* sentence) {
    char* token = strtok(sentence, " ");
    
    while (token != NULL) {
        printf("%s\n", token);
        token = strtok(NULL, " ");
    }
}

int yywrap() {
    return 1;
}
