; 补全程序，利用 jcxz 指令，在内存 2000H 处
; 查找第一个值为 0 的字节型数据，找到后存储在 dx
assume cs:code, ds:data

data segment
    db 1, 2, 3, 4, 5, 0, 0, 0, 0, 0
data ends 

code segment
    start:                        
        ;; =======================
        ; mov ax, 2000H 修改了
        mov ax, data
        mov ds, ax
        
        mov bx, 0
        
        
    S: 
        ; _________
        ; _________
        mov ch, 0
        mov cl, ds:[bx]
        jcxz OK
        inc bx
        
        jmp short S
        
    OK: 
        mov dx, bx
        
        mov ax, 4c00H
        int 21H           


        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start