#include <ulib.h>
#include <stdio.h>
#include <string.h>
#include <dir.h>
#include <file.h>
#include <error.h>
#include <unistd.h>

int
main(void) {
    int fd = open("test",O_RDONLY);
    char buffer[1000];
    read(fd,buffer,1000);
    cprintf("%s\n", buffer);
    return 0;
}

