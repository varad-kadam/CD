/* Code Gen using */

%{ 
#include<stdio.h> 
#include<string.h> 
#include"y.tab.h" 
%}
%% 
[a-zA-Z][a-zA-Z0-9]* {strcpy(yylval.cname,yytext);return ID;} 
[0-9]+ {strcpy(yylval.cname,yytext);return ID;} 
";" {strcpy(yylval.cname,yytext);return EF;} 
"*" {strcpy(yylval.cname,yytext);return M;} 
"/" {strcpy(yylval.cname,yytext);return D;} 
"+" {strcpy(yylval.cname,yytext);return A;} 
"-" {strcpy(yylval.cname,yytext);return S;} 
"=" {strcpy(yylval.cname,yytext);return EQ;} 
"\n" {strcpy(yylval.cname,yytext);return RET;} 
%% 
int main() 
{ 
FILE *fr=fopen("inputX.c","r"); 
FILE *fx=fopen("output.c","w"); 
fclose(fx); 
yyin=fr; 
yyparse(); 
return 0; 
} 