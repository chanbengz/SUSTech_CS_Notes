%{
    #define EXIT_OK 0
    #define EXIT_FAIL 1

    // global variables
    int identifiers = 0;
    int lines = 1;
%}
keyword (if|else|while|char|int|return)
letter [a-zA-Z]
letter_ {letter}|_
digit [0-9]

%%
{keyword} { /* does nothing when seeing a keyword */ }
({digit}{letter_}|{digit}*) { /* invalid identifier */ }
'{letter}* { /* string */ }
{letter_}({letter_}|{digit})* { identifiers++; printf("line %d: %s\n", lines, yytext); }
\n { lines++; }
[\t\r ]+ { /* does nothing when seeing white spaces except new line */ }
. { /* a final rule that matches when seeing any character but new line */ }
<<EOF>> { printf("There are %d occurrences of valid identifiers\n", identifiers); yyterminate(); }

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
