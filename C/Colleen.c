#include <stdio.h>
/*
  first comment
*/
static inline void donothing(){int a = 1;a = ~a;}
int main()
{
/*
  second comment
*/
donothing();
char *str = "#include <stdio.h>%c/*%c  first comment%c*/%cstatic inline void donothing(){int a = 1;a = ~a;}%cint main()%c{%c/*%c  second comment%c*/%cdonothing();%cchar *str = %c%s%c;%cprintf(str, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x22, str, 0x22, 0x0A, 0x0A, 0x0A);%c}%c";
printf(str, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x22, str, 0x22, 0x0A, 0x0A, 0x0A);
}
