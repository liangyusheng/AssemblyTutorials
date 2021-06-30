; DD 双字型数据，32 位
; define double world
assume cs:code, ds:data

; 计算 dd / dw 
; 将结果放在 dw 0 中
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