# Write a program that will create a file called heynow.txt and write the words
# "Hey diddle diddle!" into it.

.code32

.section .data

filename:
    .ascii "derp\0"

.equ LINUX_SYSTEM_CALL, 0x80
.equ EXIT_SYSTEM_CALL, 1
.equ EXIT_CODE_SUCCESS, 0

.equ SYSTEM_CREATE, 8

.section .text

.globl _start

_start:
    movl $SYSTEM_CREATE, %eax
    movl $filename, %ebx
    movl $777, %ecx
    int $LINUX_SYSTEM_CALL

    movl $EXIT_SYSTEM_CALL, %eax
    movl $EXIT_CODE_SUCCESS, %ebx
    int $LINUX_SYSTEM_CALL
