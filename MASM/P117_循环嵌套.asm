; �� data ��ÿһ����ĸת��Ϊ��д
assume cs:code, ds:data, ss:stack

stack segment stack             
    dw  '----------------'  ; 16bytes
    dw  '----------------'  ; 16bytes
stack ends

data segment
    db  'file            '
    db  'edit            '
    db  'view            '
data ends    

code segment
    start:                        
        ;; =======================   
        mov ax, stack 
        mov ss, ax
        mov sp, 32
        
        mov ax, data
        mov ds, ax  
                    
        ; 3 �� 
        mov cx, 3   
        mov di, 0
        ; bx = n * 16��n = ��������ʼ��ַ     
        mov bx, 0

    up_col:
        ; �� cx ��������
        push cx     
        ; 4 ������ 
        mov cx, 4   
        ; ��ĸλ��ƫ��
        mov si, 0   

        up_row:    
            mov al, ds:[si + bx] 
            sub al, 32
            mov ds:[si + bx], al
            inc si     
            loop up_row  
            
        ; ����
        add bx, 16      
        ; ȡ�� cx
        pop cx
        loop up_col
   
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start