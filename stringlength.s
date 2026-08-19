# escribir aca el ejercicio en MIPS
.data
palabra: .asciiz "hola"

.text
strlen:
  # implementar strlen aca
  jr      $ra
main:
  la      $a0, palabra
  jal     strlen
  # imprimir cantidad de letras
  li      $v0, 10
  syscall
