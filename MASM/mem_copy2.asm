assume cs:code 
 
; ���ڴ� FFFF:0 ~ FFFF:F �����ݸ��Ƶ� 0:200 ~ 0:20F
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
    
    ; �Ż� 16H -> 8H
    mov cx, 8H
    mov si, 0  
    
mem_copy:
    mov dx, ds:[si]
    mov es:[200H + si], dx 
    ; si += 2
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
