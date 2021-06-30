assume cs:code 
 
; 使用 ds:[bx] 这种方式
; 获取数据段内容 
code segment 
start:
    ; =====================  
    mov ax, 2000h
    mov ds, ax
    ; 设置数据 
    mov ax, 1122
    mov ds:[0], ax
    mov ax, 3344
    mov ds:[2], ax
    
    ; 方式 1
    mov ax, ds:[0]
    mov al, ds:[2]
            
    ; 方式 2        
    mov bx, 0
    mov ax, ds:[bx]
    inc bx
    inc bx
    mov al, ds:[bx]
    ; =====================
 
    ; exit to operating system.
    mov ax, 4c00h 
    int 21h    
code ends

end start 
