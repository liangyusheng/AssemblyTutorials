segment .data
    hello_msg db 'Hello, NASM!', 0xa    ; 0xa = '\n'
    hello_msg_len equ $-hello_msg       ; calc msg length

segment .text
    global _start

_start:
    mov edx, hello_msg_len
    mov ecx, hello_msg

    mov ebx, 1              ; stdout

    mov eax, 4              ; sys_write
    int 0x80

    mov eax, 1              ; sys_exit
    int 0x80
