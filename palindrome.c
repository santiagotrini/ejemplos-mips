#include <stdio.h>

int my_strlen(char *s) {
  int i = 0;
  while (s[i] != 0) i++;
  return i;
}

int palindrome(char *s) {
  int length = my_strlen(s);
  for (int i = 0; i < length/2; i++) 
    if (s[i] != s[length-i-1]) return 0;
  return 1;
}

int main(void) {
  char *s = "radar";
  char *t = "abba";
  char *u = "valentina";
  printf("%s %s palindromo\n", s, palindrome(s) ? "es" : "no es");
  printf("%s %s palindromo\n", t, palindrome(t) ? "es" : "no es");
  printf("%s %s palindromo\n", u, palindrome(u) ? "es" : "no es");
  return 0;
}
