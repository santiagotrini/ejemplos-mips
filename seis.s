.data
banana: .asciiz "banana"

.text
main:
  la      $a0, banana
  li      $a1, 'a'
  jal     char_count
  move    $a0, $v0
  li      $v0, 1
  syscall
  li      $v0, 10
  syscall

char_count:
  li      $v0, 0             # r = 0
loop:
  lb      $t0, 0($a0)    
  beq     $t0, $zero, ret    # while (s[i] != 0)
  beq     $t0, $a1, inc      # if (s[i] == c)
continue:
  addi    $a0, $a0, 1        # i++
  j       loop
inc:
  addi    $v0, $v0, 1        # r++
  j       continue        
ret:
  jr      $ra                # return
