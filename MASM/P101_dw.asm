;; ������ 8 ������������ӣ��������� ax �Ĵ�����
;; 1, 2, 3, 4, 5, 6, 7, 8
assume cs:code

code segment
    start:                        
        ;; ======================= 
        ;; Define Word 
        dw  1, 2, 3, 4, 5, 6, 7, 8    
        
        ; ƫ�Ƶ�ַ CS:0
        mov bx, 0
        ; ѭ�� 8 ��
        mov cx, 8
        ; ȡ�� CS:[X] ���ݴ���� DX
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