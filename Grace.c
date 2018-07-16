// Grace.c
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define OPEN_OPT O_WRONLY | O_TRUNC | O_CREAT
#define TITLE "Grace_kid.c"
#define MACRO(TITLE, OPEN_OPT) int main(){char *str = "// Grace.c%c#include <stdio.h>%c#include <fcntl.h>%c#include <unistd.h>%c#define OPEN_OPT O_WRONLY | O_TRUNC | O_CREAT%c#define TITLE %cGrace_kid.c%c%c#define MACRO(TITLE, OPEN_OPT) int main(){char *str = %c%s%c;int fd = open(TITLE, OPEN_OPT, 0644);dprintf(fd, str, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x22, 0x22, 0x0A, 0x22, str, 0x22, 0x0A, 0x0A);close(fd);}%cMACRO(TITLE, OPEN_OPT)%c";int fd = open(TITLE, OPEN_OPT, 0644);dprintf(fd, str, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x22, 0x22, 0x0A, 0x22, str, 0x22, 0x0A, 0x0A);close(fd);}
MACRO(TITLE, OPEN_OPT)
