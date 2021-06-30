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
        
        ; Ñ­»· 5 ´Î
        mov cx, 5  
        mov ax, 0
        mov bx, 0  
        mov si, 5
        
    change:    
        mov al, ds:[bx]
        add al, 32
        mov ds:[bx], al
        
        mov al, ds:[bx + 5]
        sub al, 32
        mov ds:[bx + 5], al
        
        inc bx 
        loop change    
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start 

; -d ds:0
; 0710:0000  68 65 6C 6C 6F 41 50 50-4C 45 00 00 00 00 00 00    helloAPPLE......