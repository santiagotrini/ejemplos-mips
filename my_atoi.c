#include <stdio.h>
#include <stdlib.h>

int my_atoi(char *s) {
  int res = 0;
  int sign = 1;
  int i = 0;
  if (s[0] == '-') {
    sign = -1;
    i++;
  }
  while (s[i] != 0) {
    res = res * 10 + (s[i] - 48);
    i++;
  }
  return res * sign;
}

int main(int argc, char *argv[]) {
  char *s = "1234";
  printf("%d\n", atoi(s) * 2); // imprime 2468
                               // atoi esta en stdlib.h
  printf("%d\n", my_atoi(s) * 2); // mi versión de atoi
  return 0;
}
