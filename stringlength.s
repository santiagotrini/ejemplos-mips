# escribir aca el ejercicio en MIPS
.data
palabra: .asciiz "hola"

.text
strlen:
  li      $v0, 0
loop:
  lb      $t0, 0($a0)
  beq     $t0, $zero, ret
  addi    $v0, $v0, 1
  addi    $a0, $a0, 1
  j       loop
ret:
  jr      $ra
main:
  la      $a0, palabra
  jal     strlen
  move    $a0, $v0
  li      $v0, 1
  syscall
  li      $v0, 10
  syscall
