;; ������� 'welcome to masm!'
;; ��ͬ��ɫ 
;; ǰ   ��   ɫ
;; 0000 0000
;;  rgb  rgb
assume cs:code, ds:data

data segment
                  ; '1234567890ABCDEF'              
    str         db  'welcome to masm!'    
    green       db  00000010b
    gbg_rtxt    db  00100100b
    wbg_btxt    db  01110001b
data ends    

code segment
    start:                        
        ;; =======================
        mov ax, data
        mov ds, ax
            
        mov ax, 0b800h
        mov es, ax
        ; pos. of text.
        mov bx, 0    
        
        mov cx, 16
        mov si, 0

    show_row:                  
        ; set text.            
        mov dl, str:[si]
        ; set color                               
        mov dh, green
        mov es:[bx], dx
        add bx, 2
        inc si
        loop show_row
              
        mov bx, 160      
        mov cx, 16
        mov si, 0
        
    show_row2:                  
        ; set text.            
        mov dl, str:[si]
        ; set color                               
        mov dh, gbg_rtxt
        mov es:[bx], dx
        add bx, 2
        inc si
        loop show_row2
                       
        mov bx, 160 + 160      
        mov cx, 16
        mov si, 0
        
    show_row3:                  
        ; set text.            
        mov dl, str:[si]
        ; set color                               
        mov dh, wbg_btxt
        mov es:[bx], dx
        add bx, 2
        inc si
        loop show_row3                       
                       
        ;; =======================
        mov ax, 4C00H
        int 21H 
                
code ends

end start

  