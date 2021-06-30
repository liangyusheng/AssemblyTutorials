; display input

segment .data
    tip db "Please input something : "
    tip_len equ $-tip

    result db "Your input is : "
    result_len equ $-result

    ; input buffer.
    buf db "                                    "
    buf_len equ $-buf

segment .text
    global _start

_start:
    ; show message.
    mov edx, tip_len
    mov ecx, tip

    mov eax, 4
    mov ebx, 1
    int 80h

    ; get input.
    mov eax, 3
    mov ebx, 2
    mov ecx, buf
    mov edx, buf_len
    int 80h
    
    ; 
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, result_len
    int 80h

    ; display output
    mov eax, 4
    mov ebx, 1
    mov ecx, buf
    mov edx, buf_len
    int 80h

    ; exit
    mov eax, 1
    mov ebx, 0
    int 0x80
