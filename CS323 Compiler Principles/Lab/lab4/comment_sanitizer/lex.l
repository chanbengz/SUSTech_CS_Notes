%{
  #define EXIT_OK 0
  #define EXIT_FAIL 1
  char c;
%}
%%
"//" { 
  // ignore the following chars until seeing a newline character
  while((c = input()) != '\n'); 
  // put the newline character back to the input buffer
  unput(c); 
}
. { printf("%s", yytext); }
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
	printf("The code after sanitization:\n");
        yylex();
        return EXIT_OK;
    } else{
        fputs("Too many arguments! Expected: 2.\n", stderr);
        return EXIT_FAIL;
    }
}
