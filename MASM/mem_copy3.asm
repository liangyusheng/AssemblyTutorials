assume cs:code, ss:stack 
; 
; ���ڴ� FFFF:0 ~ FFFF:F �����ݸ��Ƶ� 0:200 ~ 0:20F
;
stack segment stack
    db  128 dup(0)
stack ends   

code segment 
start:
    ; =====================  
    ; set segment 
    ; ���ݴ� DS ��
    mov ax, 0ffffh
    mov ds, ax
    
    ; ���ݵ� ES ȥ
    mov ax, 0
    mov es, ax
    
    mov cx, 8H
    
mem_copy:
    ;; ����ջ�ռ�������ݸ���.
    push ds:[si]
    pop es:[200H + si]
    
    add si, 2
    loop mem_copy
    
    ; =====================
 
    ; exit to operating system.
    mov ax, 4c00h 
    int 21h    
code ends

end start     
            
;; �鿴�ڴ�            
;; -d ds:0
;; -d es:200
