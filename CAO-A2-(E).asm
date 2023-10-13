# Printing out a character

.data
  char_var: .byte 'A'

.text
  main:
    lb $a0, char_var
    li $v0, 4
    syscall

    li $v0, 10
    syscall
