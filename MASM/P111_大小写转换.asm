assume cs:code, ds:data, ss:stack

data segment
    db  'HELLO'
    db  'apple'
data ends    


code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
        
        ; 循环 5 次
        mov cx, 5  
        mov ax, 0
        mov bx, 0  
        
    to_lower:    
        mov al, ds:[bx]
        add al, 32
        mov ds:[bx], al
        inc bx
        loop to_lower    

        ; 循环 5 次
        mov cx, 5  
        mov ax, 0
        mov bx, 5    
        
    to_upper:
        mov al, ds:[bx]
        sub al, 32
        mov ds:[bx], al
        inc bx
        loop to_upper 
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start