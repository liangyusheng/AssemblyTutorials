; ��ȫ�������� loop ָ����ڴ� 2000H ��
; ���ҵ�һ��ֵΪ 0 ���ֽ������ݣ��ҵ���洢�� dx
assume cs:code, ds:data

data segment
    db 1, 2, 3, 4, 5, 0, 0, 0, 0, 0
    db 0, 2, 3, 4, 5, 0, 0, 0, 0, 0
data ends 

code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
        
        mov bx, 0
        mov dx, 0
        
    S: 
        ; _________
        ; _________    
        ; �� ds:[bx] ���� cx
        mov cx, ds:[bx]     
        ; bx ����
        inc bx   
        ; cx ��������Ϊ cx = 0 ʱ
        ; CX - 1 = FFFF
        ; ���ڴ� +1
        ; ִ�� loop ʱ�Զ� -1������ѭ��
        inc cx
        loop S
        
        mov dx, bx
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start