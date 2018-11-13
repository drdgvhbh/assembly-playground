# Write a program that will create a file called heynow.txt and write the words
# "Hey diddle diddle!" into it.

.code32

.section .data

filename:
    .ascii "hey_now.txt\0"

text:
    .ascii "beep boop\n\0"

.equ LINUX_SYSTEM_CALL, 0x80
.equ EXIT_SYSTEM_CALL, 1
.equ EXIT_CODE_SUCCESS, 0

.equ SYSTEM_CREATE, 8
.equ SYSTEM_WRITE, 4
.equ SYSTEM_CLOSE, 6

.equ ST_FILE_DESCRIPTOR, -4

.section .bss

.section .text

.globl _start

_start:
    movl %esp, %ebp

    movl $SYSTEM_CREATE, %eax
    movl $filename, %ebx
    movl $0666, %ecx
    int $LINUX_SYSTEM_CALL

    subl $4, %esp

    movl %eax, ST_FILE_DESCRIPTOR(%ebp)  

    movl $SYSTEM_WRITE, %eax
    movl ST_FILE_DESCRIPTOR(%ebp), %ebx
    movl $text, %ecx
    movl $10, %edx
    int $LINUX_SYSTEM_CALL

    movl $SYSTEM_CLOSE, %eax
    movl ST_FILE_DESCRIPTOR(%ebp), %ebx
    int $LINUX_SYSTEM_CALL

    call end

write:



end:
    movl $EXIT_SYSTEM_CALL, %eax
    movl $EXIT_CODE_SUCCESS, %ebx
    int $LINUX_SYSTEM_CALL
