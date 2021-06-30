; 将 S 处的指令复制到 S0 处
assume cs:code 

code segment
    start:                        
        ;; =======================
    S:        
        mov ax, bx
        mov si, offset S
        mov di, offset S0
        ;________________
        ;________________
        ; cs 是 code 段寄存器
        mov dx, cs:[si]
        mov cs:[di], dx
        
    S0:
        nop
        nop    
         
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start