CC=gcc
FLEX=flex
idcount:
	$(FLEX) lex.l
	$(CC) lex.yy.c -lfl -o idcount.out
clean:
	@rm -f lex.yy.c *.out
