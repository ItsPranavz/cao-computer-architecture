# Program to find largest and smallest number

.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Enter the third number: "
output1: .asciiz "The largest number is: "
output2: .asciiz "\nThe smallest number is: "

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

    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    move $t3, $t0
    bgt $t1, $t3, check_second
    move $t3, $t1
    
check_second:
    bgt $t2, $t3, largest_done
    move $t3, $t2
    
largest_done:
    move $t4, $t0
    blt $t1, $t4, check_second_smallest
    move $t4, $t1
check_second_smallest:
    blt $t2, $t4, smallest_done
    move $t4, $t2
    
smallest_done:
    li $v0, 4
    la $a0, output1
    syscall
    move $a0, $t3
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, output2
    syscall
    move $a0, $t4
    li $v0, 1
    syscall

    li $v0, 10
    syscall
