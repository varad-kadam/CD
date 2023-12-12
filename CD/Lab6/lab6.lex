/*5. Write a program to change case of given input (Upper, Lower, Sentence, Toggle) */

%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[1-4]   { 
          int choice = atoi(yytext); // Read the user's choice
          printf("Enter the String : ");
          char input[100];
          scanf(" %[^\n]", input); // Read the input string including whitespaces

          switch (choice) {
            case 1: // Upper Case
                for (int i = 0; input[i]; i++) {
                    if (islower(input[i])) {
                        input[i] = toupper(input[i]); // Convert to uppercase
                    }
                }
                printf("Output: %s\n", input);
                break;

            case 2: // Lower Case
                for (int i = 0; input[i]; i++) {
                    if (isupper(input[i])) {
                        input[i] = tolower(input[i]); // Convert to lowercase
                    }
                }
                printf("Output: %s\n", input);
                break;

            case 3: // Toggle Case
                for (int i = 0; input[i]; i++) {
                    if (islower(input[i])) {
                        input[i] = toupper(input[i]); // Convert to uppercase
                    } else if (isupper(input[i])) {
                        input[i] = tolower(input[i]); // Convert to lowercase
                    }
                }
                printf("Output: %s\n", input);
                break;

            case 4: // Sentence Case
                if (islower(input[0])) {
                    input[0] = toupper(input[0]); // Convert the first character to uppercase
                }
                for (int i = 1; input[i]; i++) {
                    if (isupper(input[i])) {
                        input[i] = tolower(input[i]); // Convert to lowercase
                    }
                }
                printf("Output: %s\n", input);
                break;

            default:
                printf("Invalid choice\n");
                break;
        }
      }

\n      { /* Ignore newline characters */ }

.       { ECHO; } // Echo any other characters

%%

int main() {
    printf("1. Upper Case\n2. Lower Case\n3. Toggle Case\n4. Sentence Case\nEnter the choice: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1; // Indicate end of input
}
