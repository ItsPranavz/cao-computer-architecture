.data
  float_var: .float 3.14

.text
  main:
    l.s $f12, float_var
    li $v0, 2
    syscall

    li $v0, 10
    syscall
