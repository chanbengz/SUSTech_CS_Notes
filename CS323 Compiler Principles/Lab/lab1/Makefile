CC=gcc
CFLAGS=-I.

hello:
	$(CC) hello_world.c -o hello.out
main:
	$(CC) linked_list.c main.c -o ll_main.out
libll:
	$(CC) linked_list.c --shared -fPIC -o libll.so
clean:
	@rm -f a.out hello.out ll_main.out libll.so
.PHONY: hello main
