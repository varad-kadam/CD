/* 1.Write a program to find out whether given input is a letter or digit. */

%{
#include<stdio.h>
%}

%%
[0-9]+ {printf("\tdigit");}
[while | main | if | void | int]+ {printf("\tkeyword");}
[a-z]+ {printf("\tidentifier");}
%%