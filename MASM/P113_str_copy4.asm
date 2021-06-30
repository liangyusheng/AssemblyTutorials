assume cs:code, ds:data, ss:stack

data segment
    db  'welcome to masm!'  ; 将此行数据复制到下面
    db  '----------------'
data ends    

; 使用 push pop 复制
code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
        
        mov si, 0
        mov cx, 8        
        
    str_cpy:    
        push ds:[si]
        pop  ds:[si + 16]
        add  si, 2
        loop str_cpy
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start 

; -d ds:0
; 0710:0000  77 65 6C 63 6F 6D 65 20-74 6F 20 6D 61 73 6D 21    welcome to masm!
; 0710:0010  77 65 6C 63 6F 6D 65 20-74 6F 20 6D 61 73 6D 21    welcome to masm!