%include "stud_io.inc"
%include "syscall_io.inc"

section .data
msg	db "hello world, nice day to go to to univer", 10
msg_len	equ $-msg
st	db ""
r_addr	db "read_file"

section	.text
global _start

_start	PRINT "Введите строку:"
	PUTCHAR 10

	
	;syscall 3, 0, st, 30		;чтение
	;syscall 4, 1, st, 30		;вывод
	
	push 5
	push 64
	call w_funk

	
	PUTCHAR 10
	PRINT "Завершение"
	PUTCHAR 10
	FINISH


w_funk: mov ecx, [esp+8]
	mov eax, [esp+4]
lp:	PUTCHAR al
	loop lp
	ret



