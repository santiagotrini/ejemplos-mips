.data
numero: .asciiz "333"

.text
main:
  la      $a0, numero
  jal     atoi
  mul     $a0, $v0, 2
  li      $v0, 1
  syscall
  li      $v0, 10
  syscall

atoi:
  li      $v0, 0
  li      $t1, 1         # sign = 1
  lb      $t0, 0($a0)
  bne     $t0, 45, loop
  li      $t1, -1        # sign = -1
  addi    $a0, $a0, 1    # i++
loop:
  lb      $t0, 0($a0)
  beq     $t0, $zero, ret
  mul     $v0, $v0, 10     # r = r * 10  
  addi    $t2, $t0, -48    # t = s[i] - 48
  add     $v0, $v0, $t2    # r = r + t
  addi    $a0, $a0, 1      # i++
  j       loop
ret:
  mul     $v0, $v0, $t1    # r = r * sign
  jr      $ra
