.include "record-def.s"
.include "linux.s"

.equ ST_WRITE_BUFFER, 8
.equ ST_FILEDES, 12

.section .text
.global write_record
.type write_record, @function

write_record:
    pushl %ebp
    movl %esp, %ebp

    pushl %ebx
    movl ST_FILEDES(%ebp), %ebx
    movl ST_WRITE_BUFFER(%ebp), %ecx
    movl $RECORD_SIZE, %edx
    movl $SYS_WRITE, %eax
    int $LINUX_SYSCALL

    popl %ebx
    movl %ebp, %esp
    popl %ebp

    ret
