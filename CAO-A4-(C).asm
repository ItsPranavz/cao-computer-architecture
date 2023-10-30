.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
same_msg: .asciiz "The two numbers are the same."
different_msg: .asciiz "The two numbers are different."

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    beq $t0, $t1, numbers_same
    j numbers_different

numbers_same:
    li $v0, 4
    la $a0, same_msg
    syscall
    j exit

numbers_different:
    li $v0, 4
    la $a0, different_msg
    syscall

exit:
    li $v0, 10
    syscall
