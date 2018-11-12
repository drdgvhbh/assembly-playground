.code32

.section .data

.section .text

.globl _start

_start:
    pushl $3
    pushl $2
    call power
    addl $8, %esp
    pushl %eax
    pushl $2
    pushl $5
    call power
    addl $8, %esp

    popl %ebx

    addl %eax, %edx
    addl %ebx, %edx

    pushl $10
    pushl $1
    call power

    popl %ebx
    addl %edx, %ebx

    movl $1, %eax
    int $0x80

.type power, @function
power:
    pushl %ebp
    movl %esp, %ebp
    subl $4, %esp

    movl 8(%ebp), %ebx
    movl 12(%ebp), %ecx
    movl %ebx, -4(%ebp)

power_loop_start:
    cmpl $1, %ecx
    je end_power
    cmpl $0, %ecx
    je exp_zero
    movl -4(%ebp), %eax
    imull %ebx, %eax
    movl %eax, -4(%ebp)

    decl %ecx
    jmp power_loop_start

exp_zero:
    movl $1, -4(%ebp)

end_power:
    movl -4(%ebp), %eax
    movl %ebp, %esp
    popl %ebp
    ret
