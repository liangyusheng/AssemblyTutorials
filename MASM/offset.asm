assume cs:code, ds:data, ss:stack

data segment
    db 1, 2, 3, 4, 5, 6
data ends

stack segment stack

stack ends

code segment
    start:  mov ax, data
            mov ds, ax

    s:      mov ax, offset start
            mov ax, offset s  
            
            mov ax, 4c00h
            int 21h
            
code ends
end start
