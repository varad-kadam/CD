%{
#include <ctype.h>
#include <stdio.h>
#include <math.h>
#define YYSTYPE double

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right 'S' 'C' 'T'
%right UMINUS

%%

lines : lines expr '\n' { printf("%g\n", $2); }
      | lines '\n'
      |
      ;

expr : expr '*' expr { $$ = $1 * $3; }
     | expr '/' expr { $$ = $1 / $3; }
     | expr '+' expr { $$ = $1 + $3; }
     | expr '-' expr { $$ = $1 - $3; }
     | '(' expr ')'   { $$ = $2; }
     | 'S' '(' expr ')' { $$ = sin($3); }
     | 'C' '(' expr ')' { $$ = cos($3); }
     | 'T' '(' expr ')' { $$ = tan($3); }
     | NUMBER
     ;

%%

int yylex(void) {
    int c;
    while ((c = getchar()) == ' ')
        ;

    if (c == '.' || isdigit(c)) {
        ungetc(c, stdin);
        scanf("%lf", &yylval);
        return NUMBER;
    }

    return c;
}

void yyerror(const char *s) {
    printf("\nError encountered: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
