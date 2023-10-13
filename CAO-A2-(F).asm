.data
  double_var: .double 3.14

.text
  main:
    l.s $f12, double_var
    li $v0, 2
    syscall

    li $v0, 10
    syscall
