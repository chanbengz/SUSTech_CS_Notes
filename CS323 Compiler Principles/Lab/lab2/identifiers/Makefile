CC=gcc
FLEX=flex

all: flex

idcount:
	$(FLEX) lex.l
	$(CC) lex.yy.c -lfl -o idcount.out

test:
	./test.sh

clean:
	@rm -f lex.yy.c *.out
