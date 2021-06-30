; DD 双字型数据，32 位
; define double world
assume cs:code, ds:data

data segment              
    db  1
    dw  1
    dd  1
    db  9
data ends    

code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
        ; -d ds:0     1     1           1  9
        ; 0710:0000  01 01 00 01 00 00 00 09-00 00 00 00 00 00 00 00 
         
         
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start