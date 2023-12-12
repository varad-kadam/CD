/*2. Write a program to find out whether given input is a noun, pronoun, verb, adverb, adjective or preposition. */

%{
    #include<stdio.h>
    #include<string.h>
%}

%%

(cat|house|car) { printf("Noun: %s\n",yytext);}
(I|you|she|it|they|we|her) { printf("Pronoun: %s\n",yytext);}
(run|eat|sleep|jump|sings) { printf("Verb: %s\n",yytext);}
(quickly|slowly|loudly|quitely|beautifully) { printf("Adverb: %s\n",yytext);}
(happy|sad|big|small) { printf("Adjective: %s\n",yytext);}
(in|on|under|with) { printf("Preposition: %s\n",yytext);}
[[:alpha]]+ { printf("Unknown: %s\n",yytext);}
. { printf("Invalid Input: %s\n",yytext);}

%%

int main()
{
    yylex();
    return 0;
}