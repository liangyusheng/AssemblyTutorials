assume cs:code 
 
; �� 2000H:1000H д�� 0123456789ABCDEF
code segment 
start:
    ; =====================  
    mov ax, 2000h
    mov ds, ax
    
    mov bx, 1000H
    mov al, 0
    ; ѭ�� 16 ��
    mov cx, 10H
    
write:        
    mov ds:[bx], al         
    inc al
    inc bx
    loop write

    ; =====================
 
    ; exit to operating system.
    mov ax, 4c00h 
    int 21h    
code ends

end start    

; mov cx, 0
; �����������������ѭ����ʱ��
; cx - 1 = 0 - 1 = ffff
; ���Խ������
