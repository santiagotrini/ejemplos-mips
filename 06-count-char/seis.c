#include <stdio.h>

int char_count(char *s, char c) {
  int i = 0, r = 0;
  while (s[i] != 0) {
    if (s[i] == c) r++;
    i++;
  }
  return r;
}

int main(void) {
  printf("%d\n", char_count("banana", 'a'));
  printf("%d\n", char_count("papoi", 'p'));
  return 0;
}
