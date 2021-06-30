assume cs:code

code segment
    start:      mov ax, 0b800h 
                mov es, ax
                
                mov cx, 99
                mov di, 0
                
    show:       mov es:[si], byte ptr 'A'
                add si, 2
                loop show           
                        
                ; mov ax, 4c00h        
                ; int 0                         
code ends

end start
