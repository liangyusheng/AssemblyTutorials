
assume cs:code, ds:data

data segment              
    db  3
    db  '                '    
data ends    

code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
        
        ; 8 λ����     
        ; 16 / 3  = 5..3
        mov ax, 16
        mov bl, 3      
        div bl
        ; AX = 0105���� 5 �� 3 
        
        mov ax, 16
        div byte ptr ds:[0] 
        ; AX = 0105���� 5 �� 3 
        
        ; 16 λ���� 
        ; �������Ϊ 16 λ��������Ϊ 32 λ��
        ; DX ��Ÿ� 16 λ��AX ��ŵ� 16 λ
        ; 256 / 2 = 128
        mov ax, 256
        mov dx, 0
        mov bx, 2
        div bx 
        ; AX = 0080H = 128, DX = 0000H
         
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start