;; 利用自定义栈空间，逆序数据
;; 0123H, 0456H, 0789H, 0ABCH, 0DEFH, 0FEDH, 0CBAH, 0987H
assume cs:code, ss:stack

stack segment stack
    dw  0123H, 0456H, 0789H, 0ABCH, 0DEFH, 0FEDH, 0CBAH, 0987H
    dw  0, 0, 0, 0, 0, 0, 0
    ;; 将数据 PUSH 到此处
    dw  0, 0, 0, 0, 0, 0, 0
stack ends    

code segment
    start:                        
        ;; =======================
        ; 设置栈顶标记 SS:SP
        ; PUSH 是逆序的，从高偏移地址开始，
        ; 依次向低地址写入数据, SP - 2
        ; 内存如下
        ;
        ; -d ss:0
        ; 0710:0000  23 01 56 04 89 07 BC 0A-EF 0D ED 0F BA 0C 87 09 
        ; 0710:0010  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00 
        ; 0710:0020  00 00 00 00 00 00 00 00-00 00 00 00 00 00 23 01 
        mov sp, 48          
        ; 循环 PUSH 8 次
        mov cx, 8       
        ; 偏移地址从 ss:0 开始
        mov bx, 0
        
    push_data:    
        push ss:[bx]
        add bx, 2
        loop push_data
        
        mov si, 20H  
        mov di, 0H
        mov cx, 8  
        ; push_data 结果如下   
        ;
        ; 0710:0000  23 01 56 04 89 07 BC 0A-EF 0D ED 0F BA 0C 87 09
        ; 0710:0010  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00
        ; 0710:0020  87 09 BA 0C ED 0F EF 0D-BC 0A 89 07 56 04 23 01
        
        ; 再将 cs:20H 的数据 pop 到 cs:0H
        ;    
        mov di, 0H
        mov cx, 8
    pop_data:         
        pop ss:[di]
        add di, 2
        loop pop_data
        
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start

; 最终结果如下：
;
; 0710:0000  87 09 BA 0C ED 0F EF 0D-BC 0A 89 07 56 04 23 01
; 0710:0010  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00
; 0710:0020  87 09 BA 0C ED 0F EF 0D-BC 0A 89 07 56 04 23 01