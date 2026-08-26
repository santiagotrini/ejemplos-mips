.data
gt: .asciiz "a es mas grande\n"
lt: .asciiz "a es mas chico\n"
eq: .asciiz "son iguales\n"

.text
main:
  li      $v0, 5
  syscall
  move    $a0, $v0
  li      $v0, 5
  syscall
  move    $a1, $v0
  jal     compare
  beq     $v0, $zero, zero
  slt     $t0, $v0, $zero
  beq     $t0, $zero, greater
  la      $a0, lt
  j       print
zero:
  la      $a0, eq
  j       print
greater:
  la      $a0, gt
print:
  li      $v0, 4
  syscall
  li      $v0, 10
  syscall

compare:
  sub     $v0, $a0, $a1
  jr      $ra
