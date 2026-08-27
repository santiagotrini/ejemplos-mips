#include <stdio.h>

void my_tolower(char *s) {
  int i = 0;
  while (s[i] != 0) {
    if (s[i] >= 'A' && s[i] <= 'Z') s[i] ^= 32;
    i++;
  }
}

int main(void) {
  char s[] = "¡Luk  aT Tu!";
  my_tolower(s);
  printf("%s -> %s\n", "¡Luk  aT Tu!", s);
  return 0;
}
