section .data
sullysource: db "Sully_%d.s", 00
sysstr: db "nasm -fmacho64 Sully_%d.s;gcc -Wall -Wextra -Werror Sully_%d.o -o Sully_%d", 00
str: db "section .data%csullysource: db %cSully_%%d.s%c, 00%csysstr: db %cnasm -fmacho64 Sully_%%d.s;gcc -Wall -Wextra -Werror Sully_%%d.o -o Sully_%%d%c, 00%cstr: db %c%s%c, 00%c%%define FLAG_OPT 0x601%c%%define SYSOPEN 0x2000005%cglobal _main%cextern _dprintf%cextern _asprintf%cextern _system%cextern _free%cextern _close%csection .text%c_main:%cpush rbp%cmov rbp, rsp%csub rsp, 0x1000%cmov dword [rbp-0x4], %d%ccreate_sullys:%clea rdi, [rbp - 0x30]%clea rsi, [rel sullysource]%cmov rdx, [rbp-0x4]%cxor al, al%cpush rdx%cpush rdi%ccall _asprintf%cpop rdi%cpop rdx%cmov qword [rbp-0x4], rdx%cmov rax, SYSOPEN%cmov qword rdi, [rbp-0x30]%cmov rsi, FLAG_OPT%cmov rdx, 0o644%csyscall%ccmp rax, -1%cje end_sully%cmov [rbp-0x40], rax%cmov qword rdi, [rbp-0x30]%ccall _free%cxor rcx, rcx%cfill_newline:%cmov dword [rsp+rcx*8], 0x0A%cinc rcx%ccmp rcx, 88%cjne fill_newline%cmov rdi, [rbp-0x40]%clea rsi, [rel str]%cmov rdx, 0x0A%cmov rcx, 0x22%cmov r8, 0x22%cmov r9, 0x0A%cmov dword [rsp], 0x22%cmov dword [rsp+0x8], 0x22%cmov dword [rsp+0x10], 0x0A%cmov dword [rsp+0x18], 0x22%clea rbx, [rel str]%cmov qword [rsp+0x20], rbx%cmov dword [rsp+0x28], 0x22%cmov eax, [rbp-0x4]%cmov dword [rsp+0xA0], eax%ccall _dprintf%cmov rdi, [rbp-0x40]%ccall _close%clea rdi, [rbp-0x30]%clea rsi, [rel sysstr]%cmov rdx, [rbp-0x4]%cmov rcx, [rbp-0x4]%cmov r8, [rbp-0x4]%cxor al, al%ccall _asprintf%cmov qword rdi, [rbp-0x30]%ccall _system%cmov qword rdi, [rbp-0x30]%ccall _free%cmov eax, [rbp-0x4]%cdec eax%cmov [rbp-0x4], eax%ccmp eax, 0%cjge create_sullys%cend_sully:%cadd rsp, 0x1000%cpop rbp%cxor rax, rax%cret%c", 00
%define FLAG_OPT 0x601
%define SYSOPEN 0x2000005
global _main
extern _dprintf
extern _asprintf
extern _system
extern _free
extern _close
section .text
_main:
push rbp
mov rbp, rsp
sub rsp, 0x1000
mov dword [rbp-0x4], 5
create_sullys:
lea rdi, [rbp - 0x30]
lea rsi, [rel sullysource]
mov rdx, [rbp-0x4]
xor al, al
push rdx
push rdi
call _asprintf
pop rdi
pop rdx
mov qword [rbp-0x4], rdx
mov rax, SYSOPEN
mov qword rdi, [rbp-0x30]
mov rsi, FLAG_OPT
mov rdx, 0o644
syscall
cmp rax, -1
je end_sully
mov [rbp-0x40], rax
mov qword rdi, [rbp-0x30]
call _free
xor rcx, rcx
fill_newline:
mov dword [rsp+rcx*8], 0x0A
inc rcx
cmp rcx, 88
jne fill_newline
mov rdi, [rbp-0x40]
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
mov eax, [rbp-0x4]
mov dword [rsp+0xA0], eax
call _dprintf
mov rdi, [rbp-0x40]
call _close
lea rdi, [rbp-0x30]
lea rsi, [rel sysstr]
mov rdx, [rbp-0x4]
mov rcx, [rbp-0x4]
mov r8, [rbp-0x4]
xor al, al
call _asprintf
mov qword rdi, [rbp-0x30]
call _system
mov qword rdi, [rbp-0x30]
call _free
mov eax, [rbp-0x4]
dec eax
mov [rbp-0x4], eax
cmp eax, 0
jge create_sullys
end_sully:
add rsp, 0x1000
pop rbp
xor rax, rax
ret
