.data
prompt: .asciiz "Enter a natural number: "
result_msg: .asciiz "The sum of natural numbers is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 0

    li $t2, 1

sum_loop:
    bgt $t2, $t0, sum_done
    add $t1, $t1, $t2
    addi $t2, $t2, 1
    j sum_loop

sum_done:
    li $v0, 4
    la $a0, result_msg
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    li $v0, 10
    syscall
