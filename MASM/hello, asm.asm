assume cs:code, ds:data

data segment
	db	'hello, asm!', 0
data ends

code segment
	start:	mov ax, data
			mov ds, ax
			
			mov ax, 0b800h
			mov es, ax
			
			mov ch, 0
			mov bx, 0
			; 15 行， 35 列
			mov si, 15 + 35
			
	print:	mov cl, ds:[bx]
			mov es:[si], cl
			inc si
			; set word color.
			mov es:[si], byte ptr 00000101b
			inc bx
			inc si
			jcxz exit
			jmp print

	exit:	mov ax, 4c00h
			int 21h
code ends
end start