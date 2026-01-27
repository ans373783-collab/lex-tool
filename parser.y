%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

/* Token declarations */
%token KEYWORD IDENTIFIER NUMBER OPERATOR RELOP ASSIGN SEPARATOR

%%

program:
    program token
    |
    ;

token:
    KEYWORD
    | IDENTIFIER
    | NUMBER
    | OPERATOR
    | RELOP
    | ASSIGN
    | SEPARATOR
    ;

%%

void yyerror(const char *s) {
    printf("Parser Error: %s\n", s);
}

int main() {
    printf("Enter C-like code (Ctrl+D to stop):\n");
    yyparse();
    return 0;
}
