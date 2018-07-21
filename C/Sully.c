#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#define OPEN_OPT O_WRONLY | O_TRUNC | O_CREAT
int main(){
int i = 5;
if(i <= 0)return (0);if(strcmp(__FILE__, "Sully.c"))i--;char *buf_sys, *source_file, *str;int fd;asprintf(&source_file, "Sully_%d.c", i);fd = open(source_file, OPEN_OPT, 0644);if (fd == -1)return (1);str = "#include <fcntl.h>%c#include <stdio.h>%c#include <unistd.h>%c#include <stdlib.h>%c#include <string.h>%c#define OPEN_OPT O_WRONLY | O_TRUNC | O_CREAT%cint main(){%cint i = %d;%cif(i <= 0)return (0);if(strcmp(__FILE__, %cSully.c%c))i--;char *buf_sys, *source_file, *str;int fd;asprintf(&source_file, %cSully_%s.c%c, i);fd = open(source_file, OPEN_OPT, 0644);if (fd == -1)return (1);str = %c%s%c;dprintf(fd, str, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, i, 0x0A, 0x22, 0x22, 0x22, %c%%d%c, 0x22, 0x22, str, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, %c%%s%c, %c%%d%c, %c%%d%c, 0x22, 0x0A);if(i > 0){asprintf(&buf_sys, %cgcc -Wall -Wextra -Werror %s -o Sully_%s;./Sully_%s%c, source_file, i, i);system(buf_sys);free(buf_sys);}free(source_file);close(fd);}%c";dprintf(fd, str, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, i, 0x0A, 0x22, 0x22, 0x22, "%d", 0x22, 0x22, str, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, "%s", "%d", "%d", 0x22, 0x0A);if(i > 0){asprintf(&buf_sys, "gcc -Wall -Wextra -Werror %s -o Sully_%d;./Sully_%d", source_file, i, i);system(buf_sys);free(buf_sys);}free(source_file);close(fd);}
