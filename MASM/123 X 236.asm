assume cs:code 
 
code segment 
start:
    ; =====================  
    mov ax, 0
    mov cx, 123
    
add_number:
    add ax, 236
    loop add_number

    ; =====================
 
    ; exit to operating system.
    ;mov ax, 4c00h 
    ;int 21h    
code ends

end start 
