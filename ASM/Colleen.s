section .data
str: db "section .data%cstr: db %c%s%c%cglobal _main%cextern _printf%csection .text%c;first comment%c_main:%c;second comment%cpush rbp%cmov rbp, rsp%csub rsp, 0xE0%cxor rcx, rcx%cfill_newline:%cmov dword [rsp+rcx*8], 0x0A%cinc rcx%ccmp rcx, 29%cjne fill_newline%ccall _donothing%clea rdi, [rel str]%cmov rsi, 0x0A%cmov rdx, 0x22%clea rcx, [rel str]%cmov r8, 0x22%cmov r9, 0x0A%ccall _printf%cadd rsp, 0xE0%cpop rbp%cret%c_donothing:%cnop%cret%c"
global _main
extern _printf
section .text
;first comment
_main:
;second comment
push rbp
mov rbp, rsp
sub rsp, 0xE0
xor rcx, rcx
fill_newline:
mov dword [rsp+rcx*8], 0x0A
inc rcx
cmp rcx, 29
jne fill_newline
call _donothing
lea rdi, [rel str]
mov rsi, 0x0A
mov rdx, 0x22
lea rcx, [rel str]
mov r8, 0x22
mov r9, 0x0A
call _printf
add rsp, 0xE0
pop rbp
ret
_donothing:
nop
ret
