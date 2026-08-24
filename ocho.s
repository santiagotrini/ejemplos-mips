.text
main:
  li      $a0, 8   # x = 8
  li      $a1, 12  # y = 12
  jal     f        # f(8, 12)
  move    $a0, $v0
  li      $v0, 1
  syscall          # imprime 96
  li      $v0, 10
  syscall

f:
  # prologo funcion
  addi    $sp, $sp, -4
  sw      $ra, 0($sp)
  # fin prologo
  li      $v0, -12 # caso contrario
  beq     $a0, $a1, call_h   # si x = y
  blt     $a0, $zero, call_g # si x < 0
  bgt     $a1, $a0, call_i   # si y > x
  j       ret
call_h:
  jal     h
  j       ret
call_g:
  jal     g
  j       ret
call_i:
  jal     i
  j       ret # podria omitirse porque es lo que viene abajo
ret:
  # epilogo funcion
  lw      $ra, 0($sp)
  addi    $sp, $sp, 4
  jr      $ra

g:
  add     $v0, $a0, $a1
  jr      $ra

h:
  mul     $v0, $a0, $a0
  jr      $ra

i:
  mul     $v0, $a0, $a1
  jr      $ra
  
