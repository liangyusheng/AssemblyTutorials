; DD ˫�������ݣ�32 λ
; define double world
assume cs:code, ds:data

; ���� dd / dw 
; ��������� dw 0 ��
data segment              
    a   dd  100001
    b   dw  100
    c   dw  0
data ends    

code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
        
        mov ax, ds:[0]
        mov dx, ds:[2]
        mov bx, ds:[4]
        
        div bx  
        
        mov ds:[6], ax 
        ; ax = 03e8H
        ; -d ds:0
        ; 0710:0000  A1 86 01 00 64 00 E8 03

        
         
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start