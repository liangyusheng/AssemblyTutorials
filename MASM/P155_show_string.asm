
assume cs:code, ds:data

data segment
        ;0123456789ABCDE   F               
    db  '1) Restart PC  ', 0
    db  '2) Start system', 0
    db  '3) Show clock  ', 0
    db  '4) Set colock  ', 0    
data ends    

code segment
    start:                             
        call init_regs
        
        ; string show on screen at si pos.
        mov si, 160 * 5 + 30 * 2 
        ; string pos of ds:[x]
        mov bx, 0H       
        call show_string
        
        mov si, 160 * 6 + 30 * 2 
        mov bx, 10H
        call show_string
                        
        mov si, 160 * 7 + 30 * 2 
        mov bx, 20H
        call show_string
        
        mov si, 160 * 8 + 30 * 2 
        mov bx, 30H
        call show_string                    

        mov ax, 4C00H
        int 21H                   
        
;; ====================================
    init_regs:
        mov ax, data
        mov ds, ax
        
        mov ax, 0b800h
        mov es, ax 
        
        ret   
;; ====================================
    show_string: 
        mov ch, 0
        mov cl, ds:[bx] 
        mov es:[si], cl
        jcxz show_string_end     
        inc bx
        add si, 2
        jmp show_string      
;; ====================================
    show_string_end:
        ret 
;; ====================================

code ends

end start