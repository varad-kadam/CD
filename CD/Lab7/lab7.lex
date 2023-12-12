/* 7. Write a program to read positive integers from a file and calculate average of it. */

%{
    #include <stdio.h>
    #include <ctype.h>
    int sum = 0;
    int count = 0;
%}

%%

[0-9]+ {
  sum += atoi(yytext);
  count++;
}

%%

int main() {
  int num;

  while (scanf("%d", &num) == 1) {
    sum += num;
    count++;
  }

  if (count > 0) {
    printf("Average: %f\n", (double)sum / count);
  } else {
    printf("No numbers found!\n");
  }

  return 0;
}
