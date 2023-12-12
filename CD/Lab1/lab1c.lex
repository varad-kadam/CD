/* Program to identify keywords, digits, identifiers, operatros, and delimiters */

%%
int|if|else|for|while {printf("keywords");}
[0-9]* {printf ("digit");}
[a-zA-Z]+([A-Za-z]|[0-9])* printf("identifer");
[*|/|+|-] printf("operators");
[;]|[,] printf("Delemiter");
%%