#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#define OPEN_OPT O_WRONLY | O_TRUNC | O_CREAT
int main(){
int i = 2;
char *buf_sys, *source_file, *str;int fd;for (int l = 0;l <= i; l++){asprintf(&source_file, "Sully_%d.c", l);fd = open(source_file, OPEN_OPT, 0644);if (fd == -1)continue;str = "#include <fcntl.h>%c#include <stdio.h>%c#include <unistd.h>%c#include <stdlib.h>%c#define OPEN_OPT O_WRONLY | O_TRUNC | O_CREAT%cint main(){%cint i = %d;%cchar *buf_sys, *source_file, *str;int fd;for (int l = 0;l <= i; l++){asprintf(&source_file, %cSully_%s.c%c, l);fd = open(source_file, OPEN_OPT, 0644);if (fd == -1)continue;str = %c%s%c;dprintf(fd, str, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, l, 0x0A, 0x22, %c%%d%c, 0x22, 0x22, str, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, %c%%s%c, %c%%d%c, 0x22, 0x0A);asprintf(&buf_sys, %cgcc -Wall -Wextra -Werror %s -o Sully_%s%c, source_file, l);system(buf_sys);free(source_file);free(buf_sys);close(fd);}}%c";dprintf(fd, str, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, l, 0x0A, 0x22, "%d", 0x22, 0x22, str, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, "%s", "%d", 0x22, 0x0A);asprintf(&buf_sys, "gcc -Wall -Wextra -Werror %s -o Sully_%d", source_file, l);system(buf_sys);free(source_file);free(buf_sys);close(fd);}}
