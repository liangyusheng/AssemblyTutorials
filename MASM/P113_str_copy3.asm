assume cs:code, ds:data, ss:stack

data segment
    db  'welcome to masm!'  ; 将此行数据复制到下面
    db  '----------------'
data ends    


code segment
    start:                        
        mov ax, data
        mov ds, ax
        
        mov cx, 8
        mov si, 0   
        ; 节省 di 寄存器
        ; mov di, 16
        ; 使用字型数据提高一倍效率
    str_cpy:
        mov ax, ds:[si]
        mov ds:[si + 16], ax        
        add si, 2
        loop str_cpy
        
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start 

; -d ds:0
; 0710:0000  77 65 6C 63 6F 6D 65 20-74 6F 20 6D 61 73 6D 21    welcome to masm!
; 0710:0010  77 65 6C 63 6F 6D 65 20-74 6F 20 6D 61 73 6D 21    welcome to masm!