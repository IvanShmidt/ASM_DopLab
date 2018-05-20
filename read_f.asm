%include "stud_io.inc"
%include "syscall_io.inc"

section .data
msg	db "hello world, nice day to go to univer with my friends YOUhOO", 10
msg_len	equ $-msg
st	db ""


section	.text
global _start

_start	PRINT "Ваше предложение:"
	PUTCHAR 10
	
	syscall 4, 1, msg, msg_len		

	push msg
	push 64
	call w_funk

	
	PUTCHAR 10
	PRINT "Завершение"
	PUTCHAR 10
	FINISH


;Функция замены слов в предложении на @

w_funk: mov edi, [esp+8]
	mov ebx, [esp+4]
lp:	mov eax, [edi]
	cmp eax, 10
	jz retriv

	cmp al, 32
	jz _sp
	mov eax, ebx

_sp:	inc edi
	PUTCHAR al
	jmp lp
retriv:	ret



