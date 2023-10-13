# Printing out an integer

.data
  int_var: .word 42

.text
  main:
    lw $a0, int_var
    li $v0, 1
    syscall

    li $v0, 10
    syscall
