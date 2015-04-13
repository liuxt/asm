%define wrt 0x2000004
	%define ext	0x2000001
	section .data

	msg: dd "hello xiaozi!", 0x0a
	len: equ $-msg

	section .text
	global _main

	kernel:
		syscall
	    ret

		_main:
		mov r10,msg
		mov al,'a'
		mov bl,'b'
		mov [r10],al
 		mov [r10+1],bl
;		mov r11,msg+1
;		mov r12,[r10]
;		mov [r11],r12
;		mov r11,msg
;		  add r11,0
;		   mov r13,[r11]
;		    mov r12,msg+1
;		     add r12,0
;			  mov r14,[r12]
;			  mov [r11],r14
;			  mov [r12],r13
		    mov rax,wrt
			    mov rdi,1
				    mov rsi,msg
					    mov rdx,len
						    call kernel

						    mov rax,ext
								    mov rdi,0
									    call kernel
