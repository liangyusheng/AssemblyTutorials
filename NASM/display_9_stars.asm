; using 'times' directive.

segment .data
    stars times 9 db '*'

segment .text
    global _start

_start:
    mov edx, 9
    mov ecx, stars
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80
