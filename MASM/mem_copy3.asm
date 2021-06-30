assume cs:code, ss:stack 
; 
; 将内存 FFFF:0 ~ FFFF:F 内数据复制到 0:200 ~ 0:20F
;
stack segment stack
    db  128 dup(0)
stack ends   

code segment 
start:
    ; =====================  
    ; set segment 
    ; 数据从 DS 来
    mov ax, 0ffffh
    mov ds, ax
    
    ; 数据到 ES 去
    mov ax, 0
    mov es, ax
    
    mov cx, 8H
    
mem_copy:
    ;; 利用栈空间进行数据复制.
    push ds:[si]
    pop es:[200H + si]
    
    add si, 2
    loop mem_copy
    
    ; =====================
 
    ; exit to operating system.
    mov ax, 4c00h 
    int 21h    
code ends

end start     
            
;; 查看内存            
;; -d ds:0
;; -d es:200
