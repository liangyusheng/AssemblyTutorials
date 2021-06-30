; 补全程序，利用 loop 指令，在内存 2000H 处
; 查找第一个值为 0 的字节型数据，找到后存储在 dx
assume cs:code, ds:data

data segment
    db 1, 2, 3, 4, 5, 0, 0, 0, 0, 0
    db 0, 2, 3, 4, 5, 0, 0, 0, 0, 0
data ends 

code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
        
        mov bx, 0
        mov dx, 0
        
    S: 
        ; _________
        ; _________    
        ; 将 ds:[bx] 放入 cx
        mov cx, ds:[bx]     
        ; bx 自增
        inc bx   
        ; cx 自增，因为 cx = 0 时
        ; CX - 1 = FFFF
        ; 故在此 +1
        ; 执行 loop 时自动 -1，结束循环
        inc cx
        loop S
        
        mov dx, bx
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start