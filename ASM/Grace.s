section .data
gracekid: db "Grace_kid.s", 00
str: db "section .data%cgracekid: db %cGrace_kid.s%c, 00%cstr: db %c%s%c, 00%c%%define FLAG_OPT 0x601%c%%define SYSOPEN 0x2000005%cglobal _main%cextern _dprintf%csection .text%c%%macro start_point 0%c;first comment%c_main:%cpush rbp%cmov rbp, rsp%csub rsp, 0x150%cxor rcx, rcx%c%%%%fill_newline:%cmov dword [rsp+rcx*8], 0x0A%cinc rcx%ccmp rcx, 42%cjne %%%%fill_newline%cmov rax, SYSOPEN%clea rdi, [rel gracekid]%cmov rsi, FLAG_OPT%cmov rdx, 0o644%csyscall%cmov rdi, rax%clea rsi, [rel str]%cmov rdx, 0x0A%cmov rcx, 0x22%cmov r8, 0x22%cmov r9, 0x0A%cmov dword [rsp], 0x22%clea rax, [rel str]%cmov [rsp+0x8], rax%cmov dword [rsp+0x10], 0x22%ccall _dprintf%cadd rsp, 0x150%cpop rbp%cret%c%%endmacro%cstart_point%c", 00
%define FLAG_OPT 0x601
%define SYSOPEN 0x2000005
global _main
extern _dprintf
section .text
%macro start_point 0
;first comment
_main:
push rbp
mov rbp, rsp
sub rsp, 0x150
xor rcx, rcx
%%fill_newline:
mov dword [rsp+rcx*8], 0x0A
inc rcx
cmp rcx, 42
jne %%fill_newline
mov rax, SYSOPEN
lea rdi, [rel gracekid]
mov rsi, FLAG_OPT
mov rdx, 0o644
syscall
mov rdi, rax
lea rsi, [rel str]
mov rdx, 0x0A
mov rcx, 0x22
mov r8, 0x22
mov r9, 0x0A
mov dword [rsp], 0x22
lea rax, [rel str]
mov [rsp+0x8], rax
mov dword [rsp+0x10], 0x22
call _dprintf
add rsp, 0x150
pop rbp
ret
%endmacro
start_point
