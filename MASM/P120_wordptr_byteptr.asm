
assume cs:code, ds:data

data segment              
    db  '                '
    db  '                '
data ends       

code segment
    start:                        
        ;; =======================   
        mov ax, data
        mov ds, ax
        
        mov ds:[0], word ptr 11 ; 0011 = 000BH
        
        mov ds:[2], byte ptr 22 ; 22   = 0016H
   
        ;; =======================
        mov ax, 4C00H
        int 21H        
            
code ends

end start    

; -d ds:0    ¡¦  ¡¦  ¡¦
; 0710:0000  0B 00 16 20 20 20 20 20-20 20 20 20 20 20 20 20
; 0710:0010  20 20 20 20 20 20 20 20-20 20 20 20 20 20 20 20