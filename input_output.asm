section .data
msg db 'Please enter an input:'
len equ $ - msg

section .bss
num resb 5

section .text
global _start

_start:
	mov edx,len
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,5
	mov ecx,num
	mov ebx,0
	mov eax,3
	int 0x80

	mov edx,5
	mov ecx,num
	mov ebx,1
	mov eax,4
	int 0x80

	mov eax,1
	int 0x80



