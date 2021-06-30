assume cs:code 
 
; 将内存 FFFF:0 ~ FFFF:F 内数据复制到 0:200 ~ 0:20F
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
    
    ; 优化 16H -> 8H
    mov cx, 8H
    mov si, 0  
    
mem_copy:
    mov dx, ds:[si]
    mov es:[200H + si], dx 
    ; si += 2
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
