%{ 
#include<stdio.h> 
#include<string.h> 
%} 
 
%union yylval{char cname[10];} 
%token <cname> ID ENDL EF D M A S EQ RET 
%left '+' '-' 
%left '*' '/' 
%type <cname> expr 
 
%% 
Input: Line RET Input 
     | EF 
     ; 
Line : ID EQ expr {xprintf($1);}//{fprintf(fw,"MOV %s,AX",$1);} 
  ; 
expr : ID M ID {gprintf($1,"MUL",$3);} 
     | ID D ID {gprintf($1,"DIV",$3);}//{fprintf(fw,"MOV AX,%s",$1);fprintf(fw,"DIV AX,%s",$3);} 
     | ID A ID {gprintf($1,"ADD",$3);}//{fprintf(fw,"MOV AX,%s",$1);fprintf(fw,"ADD AX,%s",$3);} 
     | ID S ID {gprintf($1,"SUB",$3);}//{fprintf(fw,"MOV AX,%s",$1);fprintf(fw,"SUB AX,%s",$3);} 
     | ID {strcpy($$,$1);}//fprintf(fw,"MOV %s,AX",$1); 
     ; 
%% 
void xprintf(char *n1) 
{ 
FILE *fw=fopen("output.c","a"); 
fprintf(fw,"MOV %s,AX\n",n1); 
fclose(fw); 
} 
void gprintf(char *n1,char *n2,char *n3) 
{ 
FILE *fw=fopen("output.c","a"); 
 fprintf(fw,"MOV AX,%s\n",n1); 
 fprintf(fw,"%s AX,%s\n",n2,n3); 
fclose(fw); 
} 
yyerror() 
{ 
} 