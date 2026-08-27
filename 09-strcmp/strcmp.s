.data
s1: .asciiz "aa"
s2: .asciiz "aaa"

.text
main:
  la $a0, s1
  la $a1, s2
  jal strcmp
  move $a0, $v0
  li $v0, 1
  syscall
  li $v0, 10
  syscall

strcmp:
  lb $t0, 0($a0)
  lb $t1, 0($a1)
  beq $t0, $zero, ret
  bne $t0, $t1, ret
  addi $a0, $a0, 1
  addi $a1, $a1, 1
  j strcmp
ret:
  sub $v0, $t0, $t1
  jr $ra
