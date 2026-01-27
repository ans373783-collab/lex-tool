%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

/* Regular definitions */
DIGIT      [0-9]
ID         [a-zA-Z_][a-zA-Z0-9_]*

%%

"int"|"float"|"char"|"if"|"else"|"while"|"return" {
    printf("KEYWORD: %s\n", yytext);
    return KEYWORD;
}

{ID} {
    printf("IDENTIFIER: %s\n", yytext);
    return IDENTIFIER;
}

{DIGIT}+ {
    printf("NUMBER: %s\n", yytext);
    return NUMBER;
}

"=="|"!="|"<="|">="|"<"|">" {
    printf("RELATIONAL OPERATOR: %s\n", yytext);
    return RELOP;
}

"+"|"-"|"*"|"/" {
    printf("ARITHMETIC OPERATOR: %s\n", yytext);
    return OPERATOR;
}

"=" {
    printf("ASSIGNMENT OPERATOR: %s\n", yytext);
    return ASSIGN;
}

";"|","|"("|")"|"{"|"}" {
    printf("SEPARATOR: %s\n", yytext);
    return SEPARATOR;
}

[ \t\n]+        ;   /* Ignore whitespace */

. {
    printf("UNKNOWN SYMBOL: %s\n", yytext);
}

%%

int yywrap() {
    return 1;
}
