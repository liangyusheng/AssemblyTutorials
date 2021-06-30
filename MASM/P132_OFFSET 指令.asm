
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
         
        mov ax, '1' 
        mov ax, offset start 
        ; start: µØÖ·±êºÅÎª£º0
        
         
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start