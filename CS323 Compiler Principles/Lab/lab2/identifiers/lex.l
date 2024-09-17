%{
    #define EXIT_OK 0
    #define EXIT_FAIL 1

    // global variables
    int identifiers = 0;
    char* identifiers_list[100];
%}
keyword (if|else|while|char|int|float|struct|return)
letter [a-zA-Z]
letter_ {letter}|_
digit [0-9]

%%
{keyword} { /* does nothing when seeing a keyword */ }
{digit}({letter_}|{digit})* { /* invalid identifier */ }
'{letter}* { /* string */ }
x({letter_}|{digit})* { /* hex */ }
{letter_}({letter_}|{digit})* { 
    int found = 0; 
    for (int i = 0; i < identifiers; i++) {
        if (strcmp(identifiers_list[i], yytext) == 0) {
            found = 1;
            break;
        }
    }
    if (!found) identifiers_list[identifiers++] = strdup(yytext);
}
\n { /* lines++; */ }
[\t\r ]+ { /* does nothing when seeing white spaces except new line */ }
. { /* a final rule that matches when seeing any character but new line */ }
<<EOF>> { 
    if (identifiers) {
        printf("Found %d unique IDs: ", identifiers);
        for (int i = 0; i < identifiers; i++) {
            printf("%s%s", identifiers_list[i], i == identifiers - 1 ? "\n" : ", ");
        }
    } else {
        printf("No identifiers found.\n");
    }
    yyterminate(); 
}

%%
int main(int argc, char **argv){
    char *file_path;
    if(argc < 2){
        fprintf(stderr, "Usage: %s <file_path>\n", argv[0]);
        return EXIT_FAIL;
    } else if(argc == 2){
        file_path = argv[1];
        if(!(yyin = fopen(file_path, "r"))){
            perror(argv[1]);
            return EXIT_FAIL;
        }
        yylex();
        return EXIT_OK;
    } else{
        fputs("Too many arguments! Expected: 2.\n", stderr);
        return EXIT_FAIL;
    }
}
