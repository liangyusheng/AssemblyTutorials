assume cs:code, ds:data

data segment                      
    db  10  dup(1)
    db  10  dup('1')
    dw  10  dup(1)  
    dw  10  dup('1')
data ends    

code segment
    start:                        
        ;; =======================        
        mov ax, data
        mov ds, ax 
        ; -d ds:0
        ; 0710:0000  01 01 01 01 01 01 01 01-01 01 31 31 31 31 31 31    111111
        ; 0710:0010  31 31 31 31 01 00 01 00-01 00 01 00 01 00 01 00    1111......
        ; 0710:0020  01 00 01 00 01 00 01 00-31 00 31 00 31 00 31 00    ....1.1.1.1.
        ; 0710:0030  31 00 31 00 31 00 31 00-31 00 31 00 00 00 00 00    1.1.1.1.1.1.....
        ; 0710:0040  B8 10 07 8E D8 B8 00 4C-CD 21 90 90 90 90 90 90    ?.???.L?!??????
        ; 0710:0050  90 90 90 90 90 90 90 90-90 90 90 90 90 90 F4 00    ???????????????.
        ; 0710:0060  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00    ................
        ; 0710:0070  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00    ................
        
         
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start