[TOC]

#### 编译步骤

```
nasm -f elf hello.asm
ld -m elf_i386 -s hello.o -o hello 
```

##### 编译程序

``` python
#!/usr/bin/python
# -*- coding: utf8 -*-

import os
import sys

def main():
    argc = len(sys.argv)

    if (argc != 2):
        print("\033[31mJust enter the file name!\033[31m")
        print("\033[31mSuch as \'%s hello.asm\'\033[31m" %sys.argv[0])
        sys.exit()
    
    file_name = sys.argv[1]
    print("NASM file name is \'\033[34m" + file_name + "\033[0m\'")

    build_cmd = "nasm -f elf " + file_name
    print("Run command \'\033[33m" + build_cmd + "\033[0m\'")
    os.system(build_cmd)

    link_cmd = "ld -m elf_i386 -s " + file_name[:-4] + ".o -o " + file_name[:-4]
    print("Run command \'\033[33m" + link_cmd + "\033[0m\'")
    os.system(link_cmd)
    
    print("\033[32mBuild completed!\033[0m")
    print("=========== The results of the program are as follows ===========")
    os.system("./" + file_name[:-4])

    # clean temp files.
    clean_cmd = "rm -f " + file_name[:-4] + ".o " + file_name[:-4]
    os.system(clean_cmd)
    # print(clean_cmd)

if __name__ == "__main__":
    main()
```

#### 内存段

- 数据段-由.data段和.bss表示。.data节用于声明存储区，在该存储区中为程序存储了数据元素。声明数据元素后，无法扩展此部分，并且在整个程序中它保持静态。
.bss部分也是一个静态内存部分，其中包含用于稍后在程序中声明的数据的缓冲区。该缓冲存储器为零。

- 代码段-它由.text部分表示。这在内存中定义了存储指令代码的区域。这也是一个固定区域。

- 堆栈-该段包含传递给程序中的函数和过程的数据值。

#### 寄存器

IA-32体系结构中有10个32位和6个16位处理器寄存器。寄存器分为三类

- 通用寄存器
- 控制寄存器
- 段寄存器

通用寄存器进一步分为以下几类

- 数据寄存器
- 指针寄存器
- 索引寄存器

#### 数据寄存器

四个32位数据寄存器用于算术，逻辑和其他运算。这些32位寄存器可以三种方式使用

- 作为完整的32位数据寄存器：EAX，EBX，ECX，EDX。
- 下半部分的32位寄存器可用作四个16位数据寄存器：AX，BX，CX和DX。
- 上述四个16位寄存器的下半部分和上半部分可以用作八个8位数据寄存器：AH，AL，BH，BL，CH，CL，DH和DL。

![数据寄存器](./img/register1.jpg)

其中一些数据寄存器在算术运算中有特定用途。

**AX 是主要的累加器**：它用于输入 / 输出和大多数算术指令。例如，在乘法运算中，根据操作数的大小，将一个操作数存储在 EAX 或 AX 或 AL 寄存器中。

**BX 被称为基址寄存器**：因为它可以用于索引寻址。

**CX 被称为计数寄存器**：因为 ECX，CX 寄存器在迭代操作中存储循环计数。

**DX 被称为数据寄存器**：它也用于输入 / 输出操作。它还与 AX 寄存器以及 DX 一起使用，用于涉及大数值的乘法和除法运算。

#### 指针寄存器

指针寄存器是 32 位 EIP，ESP 和EBP 寄存器，以及相应的 16 位右部分IP，SP 和 BP。指针寄存器分为三类

- **指令指针 (IP)** ：16位IP寄存器存储要执行的下一条指令的偏移地址。与CS寄存器关联的IP（作为CS：IP）给出了代码段中当前指令的完整地址。
- **堆栈指针 (SP)** ：16位SP寄存器提供程序堆栈内的偏移值。与SS寄存器（SS：SP）关联的SP是指程序堆栈中数据或地址的当前位置。
- **基本指针 (BP)** ：16位BP寄存器主要帮助参考传递给子例程的参数变量。SS寄存器中的地址与BP中的偏移量相结合，以获取参数的位置。BP也可以与DI和SI组合用作特殊寻址的基址寄存器。

![register3.jpg](./img/register3.jpg)

#### 索引寄存器

32位索引寄存器ESI和EDI及其最右边的16位。SI和DI用于索引寻址，有时用于加法和减法。有两组索引指针

- **源索引 (SI)** ：用作字符串操作的源索引。
- **Destination Index (DI)** ：用作字符串操作的目标索引。

![register2.jpg](./img/register2.jpg)

#### 控制寄存器

将32位指令指针寄存器和32位标志寄存器组合起来视为控制寄存器。

许多指令涉及比较和数学计算，并更改标志的状态，而其他一些条件指令则测试这些状态标志的值，以将控制流带到其他位置。

通用标志位是：

- **溢出标志（OF）** -指示有符号算术运算后数据的高阶位（最左位）的溢出。
- **方向标记（DF）** -它确定向左或向右移动或比较字符串数据的方向。当DF值为0时，字符串操作沿从左至右的方向；当DF值设置为1时，字符串操作沿从右至左的方向。
- **中断标志（IF）** -确定是否忽略或处理外部中断（例如键盘输入等）。当值为0时，它禁用外部中断，而当值为1时，它使能中断。
- **陷阱标志（TF）** -允许在单步模式下设置处理器的操作。我们使用的DEBUG程序设置了陷阱标志，因此我们可以一次逐步执行一条指令。
- **符号标志（SF）** -显示算术运算结果的符号。根据算术运算后数据项的符号设置此标志。该符号由最左位的高位指示。正结果将SF的值清除为0，负结果将SF的值设置为1。
- **零标志（ZF）** -指示算术或比较运算的结果。非零结果会将零标志清零，零结果将其清零。
- **辅助进位标志（AF）** -包含经过算术运算后从位3到位4的进位；用于专业算术。当1字节算术运算引起从第3位到第4位的进位时，将设置AF。
- **奇偶校验标志（PF）** -指示从算术运算获得的结果中1位的总数。偶数个1位将奇偶校验标志清为0，奇数个1位将奇偶校验标志清为1。
- **进位标志（CF）** -算术运算后，它包含一个高位（最左边）的0或1进位。它还存储*移位*或*旋转*操作的最后一位的内容。

下表列出了16位标志寄存器中标志位的位置：

| Flag:   |      |      |      |      | O    | D    | I    | T    | S    | Z    |      | A    |      | P    |      | C    |
| ------- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| Bit no: | 15   | 14   | 13   | 12   | 11   | 10   | 9    | 8    | 7    | 6    | 5    | 4    | 3    | 2    | 1    | 0    |

#### 段寄存器

段是程序中定义的用于包含数据，代码和堆栈的特定区域。有三个主要部分

- **代码段**：它包含所有要执行的指令。16 位代码段寄存器或CS寄存器存储代码段的起始地址。
- **数据段**：它包含数据，常量和工作区。16 位数据段寄存器或DS寄存器存储数据段的起始地址。
- **堆栈段**：它包含数据或过程或子例程的返回地址。它被实现为“堆栈”数据结构。堆栈段寄存器或SS寄存器存储堆栈的起始地址。

除了 DS，CS 和 SS 寄存器外，还有其他段寄存器 - ES（额外段），FS 和 GS，它们提供了用于存储数据的其他段。

在汇编编程中，程序需要访问存储器位置。段中的所有内存位置均相对于该段的起始地址。段的起始地址可以是 16 或十六进制的整数，因此，所有此类存储器地址中最右边的十六进制数字为 0，通常不存储在段寄存器中。

段寄存器存储段的起始地址。为了获得数据或指令在段内的确切位置，需要一个偏移值（或位移）。为了引用段中的任何存储位置，处理器将段寄存器中的段地址与该位置的偏移值进行组合。

#### Linux 系统调用

- 将系统呼叫号码放入 EAX 寄存器中。
- 将参数保存到系统调用中的寄存器 EBX，ECX 等中。
- 调用相关中断 (80h)。
- 结果通常在 EAX 寄存器中返回。

> 有六个寄存器，用于存储所用系统调用的参数。这些是 EBX，ECX，EDX，ESI，EDI 和 EBP。这些寄存器采用从 EBX 寄存器开始的连续参数。如果有六个以上的自变量，则第一个自变量的存储位置将存储在 EBX 寄存器中。

```asm
; 以下代码片段显示了系统调用 sys_exit 的使用
mov	eax,1		; system call number (sys_exit)
int	0x80		; call kernel

; 以下代码片段显示了系统调用 sys_write 的使用
mov	edx,4		; message length
mov	ecx,msg		; message to write
mov	ebx,1		; file descriptor (stdout)
mov	eax,4		; system call number (sys_write)
int	0x80		; call kernel
```

> 所有系统调用及其编号（在调用int 80h之前放入EAX的值）都列在 */usr/include/asm/unistd.h*中。
>
> 下表显示了本教程中使用的一些系统调用

| ％eax |   名称    |     ％ebx      |    ％ecx     | ％edx  | ％esx | ％edi |
| :---: | :-------: | :------------: | :----------: | :----: | :---: | :---: |
|   1   | sys_exit  |      整型      |      --      |   --   |  --   |  --   |
|   2   | sys_fork  | struct pt_regs |      --      |   --   |  --   |  --   |
|   3   | sys_read  |   无符号整数   |    字符*     | size_t |  --   |  --   |
|   4   | sys_write |   无符号整数   | const char * | size_t |  --   |  --   |
|   5   | sys_open  |  const char *  |     整型     |  整型  |  --   |  --   |
|   6   | sys_close |   无符号整数   |      --      |   --   |  --   |  --   |

[例程：字符输出 hello.asm](./hello.asm)

[例程：显示输入 display_input.asm](./display_input.asm)

#### MOV 指令

> MOV指令的语法是
>
> ```asm
> MOV  destination, source
> ```
>
> ```asm
> MOV  register, register
> MOV  register, immediate
> MOV  memory,   immediate
> MOV  register, memory
> MOV  memory,   register
> 
> ; MOV 操作中的两个操作数应具有相同的大小
> ; 源操作数的值保持不变
> ```

下表显示了一些常见的**类型说明符**

| 类型说明符 | 寻址字节 |
| ---------- | -------- |
| 字节       | 1个      |
| 单词       | 2个      |
| 双字       | 4        |
| QWORD      | 8        |
| TBYTE      | 10       |

[例程：修改名字 change_name.asm](./change_name.asm)

#### 汇编 - 变量

define指令有五种基本形式

|       指令       |     作用     |   储存空间   |
| :--------------: | :----------: | :----------: |
|    DB (byte)     |   定义字节   | 分配1个字节  |
|    DW (word)     |    定义词    | 分配2个字节  |
| DD (double word) |   定义双字   | 分配4个字节  |
|    DQ (qword)    |   定义四字   | 分配8个字节  |
|    DT (tbyte)    | 定义十个字节 | 分配10个字节 |

> ```asm
> ; 以下是一些使用 define 指令的示例
> choice        DB  'y'
> number        DW  12345
> neg_number    DW  -12345
> big_number    DQ  123456789
> real_number1	DD  1.234
> real_number2	DQ  123.456
> ```
>
> 注意
>
> - 字符的每个字节均以其 ASCII 值以十六进制形式存储。
> - 每个十进制值都将自动转换为其等效的 16 位二进制数，并以十六进制数形式存储。
> - 处理器使用小尾数字节顺序。
> - 负数将转换为其 2 的补码表示形式。
> - 短浮点数和长浮点数分别使用 32 位或 64 位表示。

##### 分配未初始化数据的存储空间

> **reserve** 指令用于为未初始化的数据保留空间。reserve 指令采用单个操作数，该操作数指定要保留的空间单位数。每个 define 指令都有一个相关的 reserve 指令。
>
> 保留指令有五种基本形式-

|       指令        |     作用     |
| :---------------: | :----------: |
|    RESB (Byte)    | 保留一个字节 |
|    RESW (Word)    |    保留字    |
| RESD (Doube word) |   保留双字   |
|   RESQ (Qword)    |   保留四字   |
|   REST (Tbyte)    | 保留十个字节 |

##### 多种定义

```asm
; 一个程序中可以有多个数据定义语句。例如 
choice   DB  'Y'      ; ASCII of y = 79H
number1  DW  12345    ; 12345D = 3039H
number2  DD 12345679  ; 123456789D = 75BCD15H

; 汇编器为多个变量定义分配连续的内存。
```

##### 多重初始化 (times)

**TIMES** 指令允许多次初始化为相同的值。

```asm
; 例如，可以使用以下语句定义一个大小为 9 的标记的数组并将其初始化为零
marks  TIMES  9  DW  0
```

[例程：显示 9 颗星 display_9_stars.asm](./display_9_stars.asm)

NASM 提供了几个定义常量的指令。在前面的章节中，我们已经使用过EQU指令。我们将特别讨论三个指令

- EQU
- %assign
- %define

##### EQU 指令

该 **EQU** 指令用于定义常量。EQU 指令的语法如下

``` asm
CONSTANT_NAME EQU expression

; 例如
TOTAL_STUDENTS equ 50
; 然后，可以在代码中使用此常量值，例如
mov  ecx, TOTAL_STUDENTS 
cmp  eax, TOTAL_STUDENTS

; EQU 语句的操作数可以是表达式
LENGTH equ 20
WIDTH  equ 10
AREA   equ length * width
; 上面的代码段将 AREA 定义为 200 (20 * 20)。
```

[例程：常量（宏）macor.asm](./macor.asm)

##### %assign 指令

在 **％assign** 指令可以用来定义**数字常量**像 EQU 指令。该指令允许重新定义。

``` asm
; 可以将常量 TOTAL 定义为
%assign TOTAL 10
; 在代码的后面，您可以将其重新定义为
%assign TOTAL 20

; 该指令区分大小写。
```

[例程：assign.asm](./assign.asm)

##### ％define 指令

在 **％define ** 指令允许定义数值和字符串常量。该指令类似于 C 中的 #define。

``` asm
; 可以将常量 PTR 定义为
%define PTR [EBP+4]
; 该指令还允许重新定义，并且区分大小写。
```

[例程：define.asm](./define.asm)

##### INC 指令

> INC 指令用于将操作数加一。它适用于可以在寄存器或内存中的单个操作数。
>
> ``` ASM
> INC destination
> 
> ; 操作数目标可以是 8 位、16 位或 32 位操作数。
> INC EBX      ; Increments 32-bit register
> INC DL       ; Increments 8-bit register
> INC [count]  ; Increments the count variable
> ```
>
>

##### DEC 指令

> DEC 指令用于将操作数减一。它对可以在寄存器或内存中的单个操作数起作用。
>
> ``` ASM
> DEC destination
> 
> ; 操作数目标可以是 8 位、16 位或 32 位操作数。
> segment .data
>    count dw  0
>    value db  15
> 	
> segment .text
>    inc [count]
>    dec [value]
> 	
>    mov ebx, count
>    inc word [ebx]
> 	
>    mov esi, value
>    dec byte [esi]
> ```

##### ADD 和 SUB 指令

> ADD 和 SUB 指令用于对二进制数据进行字节、字和双字大小的简单加减运算，即分别对 8 位、16 位或 32 位操作数进行加减运算。
>
> ``` asm
> ADD/SUB  destination, source
> 
> ; 寄存器 寄存器
> ; 寄存器 内存
> ; 寄存器 常量数据
> ; 内存   常量数据
> ```
>
> 但是，与其他指令一样，使用 ADD/SUB 指令无法进行内存到内存的操作。ADD 或 SUB 操作设置或清除溢出和进位标志。

https://www.tutorialspoint.com/assembly_programming/assembly_arithmetic_instructions.htm 例子