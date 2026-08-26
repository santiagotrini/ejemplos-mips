#include <stdio.h>
#include <string.h>

int stringlength(char *s) {
  int i = 0;
  while (s[i] != 0) i++;
  return i;
}

int main(void) {
  char *un_string = "hola";
  printf("%d\n", strlen(un_string));       // imprime 4, strlen esta en string.h
  printf("%d\n", stringlength(un_string)); // la idea es hacer un clon de strlen 
  return 0;
}
