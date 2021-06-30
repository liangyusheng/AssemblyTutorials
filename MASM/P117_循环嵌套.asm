; 将 data 段每一行字母转换为大写
assume cs:code, ds:data, ss:stack

stack segment stack             
    dw  '----------------'  ; 16bytes
    dw  '----------------'  ; 16bytes
stack ends

data segment
    db  'file            '
    db  'edit            '
    db  'view            '
data ends    

code segment
    start:                        
        ;; =======================   
        mov ax, stack 
        mov ss, ax
        mov sp, 32
        
        mov ax, data
        mov ds, ax  
                    
        ; 3 行 
        mov cx, 3   
        mov di, 0
        ; bx = n * 16，n = 行数的起始地址     
        mov bx, 0

    up_col:
        ; 将 cx 保存起来
        push cx     
        ; 4 个单词 
        mov cx, 4   
        ; 字母位置偏移
        mov si, 0   

        up_row:    
            mov al, ds:[si + bx] 
            sub al, 32
            mov ds:[si + bx], al
            inc si     
            loop up_row  
            
        ; 换行
        add bx, 16      
        ; 取回 cx
        pop cx
        loop up_col
   
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start