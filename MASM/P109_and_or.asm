assume cs:code

code segment
    start:                        
        ;; =======================
        ; 8 bit = 1 byte
        mov al, 00001111B
        and al, 11110000B
        ; al =  00000000B 
        ; and 同真则真
        ; 将 00001111B 中为 1 的位设置为 0
        
        mov al, 00001111B
        or  al, 11110000B
        ; al =  11111111B
        ; 有真则真                        
        ; 将 00001111B 中为 0 的位设置为 1
        
        mov al, 10100101B
        and al, 10101010B
        ; al =  10100000B

        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start