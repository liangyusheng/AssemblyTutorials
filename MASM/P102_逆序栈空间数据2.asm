;; �����Զ���ջ�ռ䣬��������
;; 0123H, 0456H, 0789H, 0ABCH, 0DEFH, 0FEDH, 0CBAH, 0987H
assume cs:code, ss:stack

stack segment stack
    dw  0123H, 0456H, 0789H, 0ABCH, 0DEFH, 0FEDH, 0CBAH, 0987H
    dw  0, 0, 0, 0, 0, 0, 0
    ;; ������ PUSH ���˴�
    dw  0, 0, 0, 0, 0, 0, 0
stack ends    

code segment
    start:                        
        ;; =======================
        ; ����ջ����� SS:SP
        ; PUSH ������ģ��Ӹ�ƫ�Ƶ�ַ��ʼ��
        ; ������͵�ַд������, SP - 2
        ; �ڴ�����
        ;
        ; -d ss:0
        ; 0710:0000  23 01 56 04 89 07 BC 0A-EF 0D ED 0F BA 0C 87 09 
        ; 0710:0010  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00 
        ; 0710:0020  00 00 00 00 00 00 00 00-00 00 00 00 00 00 23 01 
        mov sp, 48          
        ; ѭ�� PUSH 8 ��
        mov cx, 8       
        ; ƫ�Ƶ�ַ�� ss:0 ��ʼ
        mov bx, 0
        
    push_data:    
        push ss:[bx]
        add bx, 2
        loop push_data
        
        mov si, 20H  
        mov di, 0H
        mov cx, 8  
        ; push_data �������   
        ;
        ; 0710:0000  23 01 56 04 89 07 BC 0A-EF 0D ED 0F BA 0C 87 09
        ; 0710:0010  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00
        ; 0710:0020  87 09 BA 0C ED 0F EF 0D-BC 0A 89 07 56 04 23 01
        
        ; �ٽ� cs:20H ������ pop �� cs:0H
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

; ���ս�����£�
;
; 0710:0000  87 09 BA 0C ED 0F EF 0D-BC 0A 89 07 56 04 23 01
; 0710:0010  00 00 00 00 00 00 00 00-00 00 00 00 00 00 00 00
; 0710:0020  87 09 BA 0C ED 0F EF 0D-BC 0A 89 07 56 04 23 01