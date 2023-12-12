/* 5. Implement LEX/FLEX code to count the number of characters, words and lines in an input file. */

%{
    #include <stdio.h>
    int lineCount = 0;
    int charCount = 0;
    int wordCount = 0;
    int vowelCount = 0;
%}

WORD [a-zA-Z]+
WHITE_SPACE [ \t]+
VOWELS [aeiouAEIOU]

%%

{WHITE_SPACE} /* Ignore white spaces */
{VOWELS} {
    vowelCount++;
    charCount += yyleng;
}
{WORD} {
    wordCount++;
    charCount += yyleng;
}

\n {
    lineCount++;
    charCount++;
}

. { charCount++; }

%%

int main() {
    yyin = fopen("input.c", "r");
        
    if (!yyin) {
        fprintf(stderr, "Could not open input file\n");
        
        return 1;
    }

    yylex();
    fclose(yyin);
    printf("Line count: %d\n", lineCount);
    printf("Character count: %d\n", charCount);
    printf("Word count: %d\n", wordCount);
    printf("Vowel count: %d\n", vowelCount);
    return 0;
}

int yywrap() {
    return 1;
}
