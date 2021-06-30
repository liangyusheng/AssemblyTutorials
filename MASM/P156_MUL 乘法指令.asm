
assume cs:code, ds:data

data segment
    db  5, 0, 0, 0 
    db  0, 0, 0, 0 
    db  0, 0, 0, 0 
    db  0, 0, 0, 0 
    dw  1FH, 0, 0, 0 
    dw  0, 0, 0, 0   
data ends    

code segment
    start:                
        mov ax, data
        mov ds, ax             
;; ====================================
        ; 1. 8 位乘法
        mov al, 10H
        mov bl, 2H
        mul bl
        ; al = 20H
        
        mov al, 10H
        mul byte ptr ds:[0]  
        ; al = 50H
        
        ; 2. 16 位乘法
        mov ax, 1FH
        mov bx, ds:[10H]
        mul bx
        ; ax = 03C1H                                         

        mov ax, 4C00H
        int 21H                   
        

;; ====================================

code ends

end start