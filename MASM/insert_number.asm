assume cs:code 
 
; 向内存 0:200 ~ 0:23F 依次传递数据 0 ~ 63(3FH)
code segment 
start:
    ; =====================  
    mov ax, 0
    mov ds, ax
    
    mov cx, 40H ; 40H = 64
    mov di, 0
    
insert_number:
    mov ds:[200H + di], di
    inc di                
    loop insert_number  
    ;; -d DS:200
    
    
    ; =====================
 
    ; exit to operating system.
    mov ax, 4c00h 
    int 21h    
code ends

end start 
