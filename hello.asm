section .data
var1 db 'h'
var2 db 'e'
var3 db 'l'
var4 db 'l'
var5 db 'o'
var6 db 0x0a
section .text
global _start

_start:
init: mov r8,4	;r8 is the counter
judge1: mov r9,r8 ;r9 checks the value of r8
cmp r9,0
jl end_outer
mov r10,0	;r10 is the inner loop
judge2: cmp r10,r8
jge end_inner
mov r11,var1
add r11,r10
mov al,[r11]
mov r12,var1+1
add r12,r10
mov bl,[r12]
cmp al,bl
jle	not_swap
swap: mov [r11] ,bl
mov [r12], al
not_swap: add r10,1
jmp judge2
end_inner: sub r8,1
jmp judge1
end_outer:
mov rax, 0x2000004
mov rdi, 1
mov rsi,var1
mov rdx, 6

syscall

mov rax, 0x2000001
mov rdi, 0
syscall
