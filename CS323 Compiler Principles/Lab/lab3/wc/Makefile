CC=gcc
FLEX=flex
wc:
	$(FLEX) lex.l
	$(CC) lex.yy.c -lfl -o wc.out
clean:
	@rm -f lex.yy.c *.out
.PHONY: wc
