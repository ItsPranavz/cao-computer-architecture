# Counted number of factors

.data
prompt_num: .asciiz "Enter a number: "
prompt_count: .asciiz "Enter the count: "
result: .asciiz "Factors: "
newline: .asciiz "\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt_num
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, prompt_count
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, result
    syscall

    li $t2, 1
    li $t3, 0

loop:

    beq $t2, $t0, done

    div $t0, $t2 
    mfhi $t4
    beqz $t4, print
    j next

print:
    li $v0, 1
    move $a0, $t2
    syscall

    addi $t3, $t3, 1

    li $v0, 4
    la $a0, newline
    syscall

    beq $t3, $t1, done

next:
    addi $t2, $t2, 1
    j loop

done:
    li $v0, 10
    syscall