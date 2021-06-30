assume cs:code, ds:data

data segment
    db  'hello, asm!!'    
data ends    

code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
        ; -d ds:0    
        ; mov al, 'A'
        ; mov al, 'B'
        
        nop
        nop
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start