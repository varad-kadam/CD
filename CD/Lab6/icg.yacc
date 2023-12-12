%{ 
	#include<stdio.h> 
	#include<string.h> 
	struct icode 
	{ 
		char op1; 
		char op2; 
		char op; 
		char temp; 
	}; 
	int index1=0; 
	char sr[50]; 
	char addintotable(char op1,char op2,char op); 
	int search(char name,int cnt); 
%} 
 
%union 
{ 
	char p; 
} 
 
%token<p> Letter 
%token<p> Digit 
%type<p> expr 
%left '-' '+' 
%right '*' '/' 
%right UMINUS   
 
%% 
 
Stat	:	Letter'='expr';' {addintotable((char)$1,(char)$3,'=');} 
	|	expr';' 
; 
expr	:	expr'+'expr {$$=addintotable((char)$1,(char)$3,'+');} 
	|	expr'-'expr {$$=addintotable((char)$1,(char)$3,'-');} 
	|       expr'*'expr {$$=addintotable((char)$1,(char)$3,'*');} 
	|       expr'/'expr {$$=addintotable((char)$1,(char)$3,'/');} 
	|	'('expr')'  {$$=(char)$2;} 
	|       Digit  {$$=(char)$1;} 
	|       Letter  {$$=(char)$1;} 
        |       '-'expr %prec UMINUS {$$=$2;} 
; 
 
%% 
yyerror(char *s) 
{ 
	printf("%s",s); 
	//exit(0); 
} 
struct icode code[20]; 
char temp = 'A' ; 
char addintotable(char op1,char op2,char op) 
{ 
	//char temp='A'; 
	code[index1].op1=op1; 
	code[index1].op2=op2; 
	code[index1].op=op; 
        
	sr[index1++]=temp++; 
	return temp; 
 
} 
 
int search(char name,int cnt) 
{ 
 int i; 
 for(i=0;i<cnt;i++) 
       if(name==sr[i]) 
		return i; 
 return -1; 
} 
threeaddresscode() 
{ 
	int cnt=0; 
	char temp='A'; 
	printf("\n\n\tThree Address Code\n\n"); 
	temp++; 
	while(cnt<index1) 
	{ 
		printf("%c:=\t",temp); 
      		printf("%c\t",code[cnt].op1); 
		printf("%c\t",code[cnt].op); 
		printf("%c\t",code[cnt].op2); 
		 
   		printf("\n"); 
		cnt++; 
		temp++; } } 
 
void quadraple() 
{ 
	int cnt=0; 
	char temp='A'; 
	temp++; 
	printf("\n\n\tQuadraples\n"); 
	printf("\nID	arg1	arg2	op	result\n"); 
	while(cnt<index1) 
	{ 
		printf("\n(%d)\t",cnt); 
                printf("%c\t",code[cnt].op1); 
                printf("%c\t",code[cnt].op2); 
           	printf("%c\t",code[cnt].op); 
		printf("%c\t",temp); 
		 
		cnt++; 
		temp++; 
	} 
} 
 
 
void triple() 
{ 
	int k,cnt=0; 
        printf("\n\n\tTriples\n"); 
        printf("\narg1    arg2    op\n"); 
        while(cnt<index1) 
        { 
                if(isupper(code[cnt].op1)) 
			{ 
			   k=search(code[cnt].op1,index1); 
                           printf("%d\t",k-1); 
			} 
		else  
			printf("%c\t",code[cnt].op1); 
                
		if(isupper(code[cnt].op2)) 
                        { 
			   k=search(code[cnt].op2,index1); 
                           printf("%d\t",k-1); 
			} 
		else  
                        printf("%c\t",code[cnt].op2); 
                                                                                          
                printf("%c\t",code[cnt].op); 
		printf("\n"); 
                cnt++; 
        } 
} 
 
#include "lex.yy.c" 
 
main() 
{ 
	printf("\nEnter the Expression :"); 
	yyparse(); 
	threeaddresscode(); 
	quadraple(); 
	triple(); 
} 
yywrap() 
{ 
	return 1; 
} 