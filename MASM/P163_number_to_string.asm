
assume cs:code, ds:data

data segment
    dw 1234, 2345, 3456
data ends    

code segment
    start:                
        call init_reg
        
        ; ��Ļλ�ã�5 �� 30 ��
        mov si, 80 * 2 * 5 + 30 * 2   
        mov ax, ds:[0] 
        call number_to_string                 
                                              
        mov si, 80 * 2 * 6 + 30 * 2   
        mov ax, ds:[2] 
        call number_to_string 
          
        mov si, 80 * 2 * 7 + 30 * 2   
        mov ax, ds:[4] 
        call number_to_string                                                             
                                              
        mov ax, 4C00H
        int 21H 

;; ====================================
init_reg:
        mov ax, data
        mov ds, ax
        
        mov ax, 0b800h
        mov es, ax
        
        ret
;; ====================================
number_to_string:     
    ; ���������Ϊ�����ѭ��
    if_al_no_zero: 
        mov bl, 10
        div bl        
        add ah, 30H
        mov es:[si], ah   
                             
        sub si, 2 
        ; ������Ϊ 0 ʱ��ת
        mov ah, 0  
        mov cx, ax 
        inc cx
                         
        loop if_al_no_zero                 
        
        ret
;; ====================================

code ends

end start