; �� S ����ָ��Ƶ� S0 ��
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
        ; cs �� code �μĴ���
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