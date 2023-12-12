/* 3. Write a program to count number of lines, characters, words and vowels from given input. */

%{
#include<stdio.h>
int lc=0,sc=0,vc=0,ch=0,wc=0;
%}

%%
[a e i o u A E I O U] {vc++; vc+=yyleng;}
[\n] {lc++; ch+=yyleng;}
[^\t\n ]+ {wc++; ch+=yyleng;}
%%

int yywrap() {return 1;  }
int main()
{
    printf("Enter the sentence:");
    yylex();
    printf("Number of lines: %d\n",lc);
    printf("Number of characters: %d\n",ch);
    printf("Number of words: %d\n",wc);
    printf("Number of vowels: %d\n",vc);
    return 0;
}