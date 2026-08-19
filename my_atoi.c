#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  char *s = "1234";
  printf("%d\n", atoi(s) * 2); // imprime 2468
                               // atoi esta en stdlib.h
  return 0;
}
