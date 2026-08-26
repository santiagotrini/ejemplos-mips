#include <stdio.h>

int wc(char *s) {
  int i = 0, r = 0;
  int in_word = 0;
  while (s[i] != 0) {
    if (s[i] != ' ') {
      if (!in_word) {
        r++;
        in_word = 1;
      }
    } else {
      in_word = 0;
    }
    i++;
  }
  return r;
}

int main(void) {
  printf("%d\n",wc("Oh! Bello, papaguena! Tu le bella comme le papaya"));
  return 0;
}
