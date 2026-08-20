# escribir aca el ejercicio en MIPS
.data
palabra: .asciiz "fischer"

.text
palindrome:
  addi    $sp, $sp, -8
  sw      $ra, 0($sp)
  sw      $a0, 4($sp)
  jal     strlen
  lw      $a0, 4($sp)
  addi    $sp, $sp, 4
  move    $s0, $v0      # $s0 = strlen(palabra)
  add     $s1, $a0, $s0 # $s1 = puntero derecho
  addi    $s1, $s1, -1  
  li      $s2, 0        # i = 0
  div     $s3, $s0, 2   # $s3 = strlen(palabra) / 2
  li      $v0, 1        # $v0 = 1 (es palindromo)
loop_palindrome:
  beq     $s2, $s3, ret_palindrome
  lb      $t0, 0($a0)
  lb      $t1, 0($s1)
  bne     $t0, $t1, false
  addi    $a0, $a0, 1
  addi    $s1, $s1, -1
  addi    $s2, $s2, 1
  j       loop_palindrome
false:
  li      $v0, 0
ret_palindrome:
  lw      $ra, 0($sp)
  addi    $sp, $sp, 4
  jr      $ra

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
  jal     palindrome
  move    $a0, $v0
  li      $v0, 1
  syscall
  li      $v0, 10
  syscall
