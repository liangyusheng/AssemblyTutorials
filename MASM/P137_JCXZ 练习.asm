; ��ȫ�������� jcxz ָ����ڴ� 2000H ��
; ���ҵ�һ��ֵΪ 0 ���ֽ������ݣ��ҵ���洢�� dx
assume cs:code, ds:data

data segment
    db 1, 2, 3, 4, 5, 0, 0, 0, 0, 0
data ends 

code segment
    start:                        
        ;; =======================
        ; mov ax, 2000H �޸���
        mov ax, data
        mov ds, ax
        
        mov bx, 0
        
        
    S: 
        ; _________
        ; _________
        mov ch, 0
        mov cl, ds:[bx]
        jcxz OK
        inc bx
        
        jmp short S
        
    OK: 
        mov dx, bx
        
        mov ax, 4c00H
        int 21H           


        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start