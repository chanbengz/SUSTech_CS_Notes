CC=gcc
FLEX=flex

all: idcount test

idcount:
	$(FLEX) lex.l
	$(CC) lex.yy.c -lfl -o idcount.out

test:
	./idcount.out test.c

clean:
	@rm -f lex.yy.c *.out
