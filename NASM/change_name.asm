; 下面的程序说明了上面讨论的一些概念。它在存储器的数据部分中存储名称“ Zara Ali”，然后以编程方式将其值更改为另一个名称“ Nuha Ali”并显示这两个名称。

segment .data
    name db "Zara Ali", 0xa
    name_len equ $-name

    tip db "The old name is: "
    tip_len equ $-tip

    tip_2 db "The new name is: "
    tip_2_len equ $-tip_2

segment .text
    global _start

_start:
    ; show tip.
    mov edx, tip_len
    mov ecx, tip
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; show old name.
    mov edx, name_len
    mov ecx, name
    mov ebx, 1
    mov eax, 4
    int 0x80

   ; show tip2
    mov edx, tip_2_len
    mov ecx, tip_2
    mov ebx, 1
    mov eax, 4
    int 0x80


    ; change old name.
    mov [name], dword "Nuha"

    ; writing the name 'Nuha Ali'
    mov edx, 8
    mov ecx, name
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80
