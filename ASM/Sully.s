section .data
sullysource: db "Sully_%d.s", 00
sysstr: db "gcc -Wall -Wextra -Werror Sully_%d.s -o Sully_%d", 00
str: db "section .data%csullysource: db %cSully_%%d.s%c, 00%csysstr: db %cgcc -Wall -Wextra -Werror Sully_%%d.s -o Sully_%%d%c, 00%cstr: db %c%s%c, 00%c%%define FLAG_OPT 0x601%c%%define SYSOPEN 0x2000005%cglobal _main%cextern _dprintf%csection .text%c%%macro start_point 0%c;first comment%c_main:%cpush rbp%cmov rbp, rsp%csub rsp, 0x150%cxor rcx, rcx%c%%%%fill_newline:%cmov dword [rsp+rcx*8], 0x0A%cinc rcx%ccmp rcx, 42%cjne %%%%fill_newline%cmov rax, SYSOPEN%clea rdi, [rel gracekid]%cmov rsi, FLAG_OPT%cmov rdx, 0o644%csyscall%cmov rdi, rax%clea rsi, [rel str]%cmov rdx, 0x0A%cmov rcx, 0x22%cmov r8, 0x22%cmov r9, 0x0A%cmov dword [rsp], 0x22%clea rax, [rel str]%cmov [rsp+0x8], rax%cmov dword [rsp+0x10], 0x22%ccall _dprintf%cadd rsp, 0x150%cpop rbp%cret%c%%endmacro%cstart_point%c", 00
%define FLAG_OPT 0x601
%define SYSOPEN 0x2000005
global _main
extern _dprintf
extern _asprintf
extern _system
extern _free

section .text
_main:
push rbp
mov rbp, rsp
sub rsp, 0x1000
mov dword [rbp-0x4], 5

create_sullys:
lea rdi, [rbp - 0x8]
lea rsi, [rel sullysource]
mov rdx, [rbp-0x4]
xor al, al
call _asprintf

mov rax, SYSOPEN
mov qword rdi, [rbp-0x8]
mov rsi, FLAG_OPT
mov rdx, 0o644
syscall
mov [rbp-0x10], rax

mov qword rdi, [rbp-0x8]
call _free

xor rcx, rcx
fill_newline:
mov dword [rsp+rcx*8], 0x0A
inc rcx
cmp rcx, 400
jne fill_newline
mov rdi, [rbp-0x10]
lea rsi, [rel str]
mov rdx, 0x0A
mov rcx, 0x22
mov r8, 0x22
mov r9, 0x0A
mov dword [rsp], 0x22
mov dword [rsp+0x8], 0x22
mov dword [rsp+0x10], 0x0A
mov dword [rsp+0x18], 0x22
lea rbx, [rel str]
mov qword [rsp+0x20], rbx
mov dword [rsp+0x28], 0x22
call _dprintf

mov rax, [rbp-0x4]
dec rax
cmp rax, 0
jz end_sully
lea rdi, [rbp-0x8]
lea rsi, [rel sysstr]
mov rcx, [rbp-0x4]
mov rdx, [rbp-0x4]
push r10
call _asprintf
pop r10

mov qword rdi, [rbp-0x8]
call _system

mov qword rdi, [rbp-0x8]
call _free
mov rax, [rbp-0x4]
dec rax
mov [rbp-0x4], rax
cmp rax, 0
jge create_sullys

end_sully:
add rsp, 0x1000
pop rbp
ret

