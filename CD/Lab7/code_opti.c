/* Program : Assignment to optimize the generated equivalent three-address code. */

#include<stdio.h> 
#include<conio.h> 
#include<string.h> 
#include<stdlib.h> 
#include<ctype.h> 
 
void input(int); 
void print(int); 
void csub(int); 
void generate(int,int,int); 
void ceval(int); 
int calc(int); 
void subst(int,int,int); 
struct code 
{ 
 char op; 
 char op1[5],op2[5] ; 
 char res[5]; 
}; 
struct code arr[10]; 
void main() 
{ 
 int ch,n; 
 clrscr(); 
 printf("\nCode Optimization Techniques : \n"); 
 printf("\n1. Common Subexpression Elimination \n"); 
 printf("\n2. Constant Expression Evaluation \n"); 
 printf("\nEnter Your Choice : "); 
 scanf("%d",&ch); 
 switch(ch) 
 { 
 
  case 1: printf("\n Enter The Number of Expression : "); 
	  scanf("%d",&n); 
	  input(n); 
	  print(n); 
	  csub(n); 
	  printf("\n"); 
	  printf("\n \nThe Optimized Code Is : \n"); 
	  print(n); 
	  break; 
 
  case 2: printf("\Enter The Number of Expression : "); 
	  scanf("%d",&n); 
	  input(n); 
	  print(n); 
	  printf("\n"); 
	  printf("\n \nThe Optimized Code Is : \n"); 
	  ceval(n); 
	  print(n); 
	  break; 
  } 
getch(); 
} 
void input(int n) 
{ 
   int i; 
   for(i=0;i<n;i++) 
     { 
       printf("\nEnter the Expression (op,op1,op2,res)   :  "); 
       scanf( " %c%s%s%s",&arr[i].op,&arr[i].op1,&arr[i].op2,&arr[i].res); 
     } 
} 
void print(int n) 
 { 
     int i; 
   for(i=0;i<n;i++) 
    { 
      if(arr[i].op=='n') 
	 continue; 
      printf("\n%s=%s% c%s",arr[i].res,arr[i].op1,arr[i].op,arr[i].op2); 
    } 
 } 
 void csub(int n) 
 { 
   int i ,j; 
   for (i=0;i<n;i++) 
     { 
       for(j=i+1;j<n;j++) 
	 { 
	   if(arr[i].op==arr[j].op) 
	     { 
	       if((arr[i].op=='+') ||(arr[i].op=='*')) 
		 { 
		   if((strcmp(arr[i].op1,arr[j].op1)==0) && (strcmp(arr[i].op2,arr[j].op2)==0) 
			||(strcmp(arr[i].op1,arr[j].op2)==0) && (strcmp(arr[i].op2,arr[j].op1)==0)) 
			generate(i,j,n); 
		 } 
		else 
		 { 
		  if(arr[i].op1==arr[j].op1 && arr[i].op2==arr[j].op2) 
		    generate(i,j,n); 
		 } 
	      } 
	   } 
       } 
 } 
 
 void generate(int i,int j,int n) 
  { 
    int k; 
    for(k=j+1;k<n;k++) 
      { 
       if(strcmp(arr[k].op1,arr[j].res)==0) 
	  strcpy(arr[k].op1,arr[i].res); 
       if(strcmp(arr[k].op2,arr[j].res)==0) 
	  strcpy(arr[k].op2,arr[i].res); 
       if(strcmp(arr[k].res,arr[j].res)==0) 
	  strcpy(arr[k].res,arr[i].res); 
      } 
      arr[j].op='n'; 
 } 
 
 
 void ceval(int n) 
 { 
   int i,tot; 
   char op11[10],op22[10]; 
 
  for(i=0;i<n;i++) 
   { 
     strcpy(op11,arr[i].op1); 
     strcpy(op22,arr[i].op2); 
    if(isdigit(*op11)) 
     { 
	if (isdigit(*op22)) 
	 { 
		tot=calc(i); 
		subst(tot,i,n); 
	 } 
     } 
   } 
} 
int calc(int i) 
{ 
 int op11,op22,tot; 
 char opp; 
 op11=atoi(arr[i].op1); 
 op22=atoi(arr[i].op2); 
 opp=arr[i].op; 
 switch(opp) 
 { 
 
   case '+':tot=op11+op22; 
	    return(tot); 
 
   case '-':tot=op11-op22; 
	     return(tot); 
   case '*':tot=op11*op22; 
	    return(tot);  } return(0); } void subst(int tot,int i,int n) 
 { 
  int k; 
  char op11[10]; 
  itoa(tot,op11,10); 
  for(k=i+1;k<n;k++) 
    { 
      if(strcmp(arr[k].op1,arr[i].res)==0) 
	 strcpy(arr[k].op1,op11); 
       if(strcmp(arr[k].op2,arr[i].res)==0) 
	  strcpy(arr[k].op2,op11); 
    } 
 } 