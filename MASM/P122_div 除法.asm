
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
        
        ; 8 位除法     
        ; 16 / 3  = 5..3
        mov ax, 16
        mov bl, 3      
        div bl
        ; AX = 0105，商 5 余 3 
        
        mov ax, 16
        div byte ptr ds:[0] 
        ; AX = 0105，商 5 余 3 
        
        ; 16 位除法 
        ; 如果除数为 16 位，被除数为 32 位，
        ; DX 存放高 16 位，AX 存放低 16 位
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