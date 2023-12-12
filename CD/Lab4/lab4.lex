/* 4. Write a program to read input from a file and find & replace a given string. */

%{
#include<stdio.h>
#include<string.h>
char replace_with[]="Hello";
char replace[]="Bye"; 
%}

%%
[a-zA-Z]+ { if(strcmp(yytext,replace)==0)
	fprintf(yyout,"%s",replace_with);
	else 
	fprintf(yyout,"%s",yytext);}
	fprintf(yyout,"%s",yytext);
%%
 
 
int yywrap()
{
    return 1;
}
 
int main()
{
    extern FILE *yyin, *yyout;
    yyin=fopen("input.txt","r");
    yyout=fopen("output.txt","w");
    yylex();
    
}