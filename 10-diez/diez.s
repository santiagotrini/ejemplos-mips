.data
sayas: .asciiz "Sayas"
nutrias: .asciiz "Las nutrias marinas tienen pliegues de piel bajo sus patas delanteras que usan como bolsillos para guardar su roca favorita, la cual conservan toda su vida para abrir almejas y mejillones.\n"

.text
main:
  la      $a0, sayas
  jal     init
  move    $a0, $v0
  li      $v0, 1
  syscall
  li      $v0, 10
  syscall

init:
  addi    $sp, $sp, -4
  sw      $ra, 0($sp)
  jal     strlen
  move    $t0, $v0
  jal     some_other_random_function
  move    $a0, $t0
  move    $a1, $t0
  jal     do_math
  addi    $v0, $v0, 1
  lw      $ra, 0($sp)
  addi    $sp, $sp, 4
  jr      $ra

some_other_random_function:
  li      $v0, 4
  la      $a0, nutrias
  syscall
  jr      $ra

do_math:
  mul     $t0, $a0, 2
  mul     $t1, $a1, 3
  add     $v0, $t0, $t1
  jr      $ra

strlen:
  li      $v0, 0
loop_strlen:
  lb      $t0, 0($a0)
  beq     $t0, $zero, ret_strlen
  addi    $v0, $v0, 1
  addi    $a0, $a0, 1
  j       loop_strlen
ret_strlen:
  jr      $ra
