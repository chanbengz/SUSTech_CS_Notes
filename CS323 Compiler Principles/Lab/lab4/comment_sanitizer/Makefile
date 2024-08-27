CC=gcc
FLEX=flex
sanitizer:
	$(FLEX) lex.l
	$(CC) lex.yy.c -lfl -o sanitizer.out
clean:
	@rm -f lex.yy.c *.out
.PHONY: sanitizer
