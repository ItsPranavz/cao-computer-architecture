# Checking factors

.data
    prompt: .asciiz "Enter a number: "
    resultMessage: .asciiz "Factors: "

.text
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 1

    li $v0, 4
    la $a0, resultMessage
    syscall

    loop:
        divu $t2, $t0, $t1
        mfhi $t3  
        
        beq $t3, $zero, print_factor

        j continue_loop

    print_factor:

        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 11
        li $a0, 10
        syscall

    continue_loop:

        addi $t1, $t1, 1 
        ble $t1, $t0, loop

    li $v0, 10
    syscall