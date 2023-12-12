/* 2. Implement a Lexical Analyzer using LEX for a subset of C programming language. */

%{
    #include<stdio.h>
    int COMMENT=0;
%}

%%

#.* {printf("\n%s : preprocessor directive",yytext);}
int|main|float|char|double|while|for|struct|typedef|do|if|break|conƟnue|void|switch|return|printf|scan|else|goto {printf("\n\t%s : keyword",yytext);}
[aA-zZ]* {printf("\n\t%s : variable",yytext);}
\".*\" {if(!COMMENT)printf("\n\t %s : STRING",yytext);}
[0-9]+ {if(!COMMENT) printf("\n %s : NUMBER ",yytext);}
= {if(!COMMENT) printf("\n\t %s : ASSIGNMENT OPERATOR",yytext);}
"-" | "*" |"+" | "/" {printf("\n\%s: operator",yytext);}
"}" | "{" | "(" | ")" {printf("\n\t%s : delimiter",yytext);}
\<= | \>= | \< | == | \> {if(!COMMENT) printf("\n\t%s : RELATIONAL OPERATOR",yytext);}

%%

int main()
{
    FILE *file;
    file=fopen("input.c","r");
    
    if(!file)
    {
        printf("could not open the file");
        exit(0);
    }

    yyin=file;
    yylex();
    printf("\n");
    
    return(0);
}

int yywrap()
{
    return(1);
}