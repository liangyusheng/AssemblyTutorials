;; 将下面 8 个字型数据相加，结果存放在 ax 寄存器中
;; 1, 2, 3, 4, 5, 6, 7, 8
assume cs:code

code segment
    start:                        
        ;; ======================= 
        ;; Define Word 
        dw  1, 2, 3, 4, 5, 6, 7, 8    
        
        ; 偏移地址 CS:0
        mov bx, 0
        ; 循环 8 次
        mov cx, 8
        ; 取出 CS:[X] 数据存放在 DX
        mov dx, 0  
        mov ax, 0
        
    add_number:
        mov dx, cs:[bx]
        add ax, dx
        add bx, 2
        loop add_number
  
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start

;; AX = 0024H = 36