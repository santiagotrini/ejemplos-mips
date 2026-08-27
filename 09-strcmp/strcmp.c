#include <stdio.h>
#include <string.h>

int my_strcmp(char *s, char *t) {
  int i = 0;
  while (s[i] != 0 && s[i] == t[i]) i++;
  return s[i] - t[i];
}

int main(void) {
  printf("%d - %d\n", strcmp("aaa","aab"), my_strcmp("aaa","aab"));
  printf("%d - %d\n", strcmp("aa","aaa"), my_strcmp("aa","aaa"));
  printf("%d - %d\n", strcmp("burro","arbol"), my_strcmp("burro","arbol"));
  return 0;
}
