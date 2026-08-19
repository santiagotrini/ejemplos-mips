#include <stdio.h>

int compare(int a, int b) {
  return a - b;
}

int main(void) {
  int a, b;
  scanf("%d %d", &a, &b);
  int c = compare(a,b);
  if      (c == 0) puts("son iguales");
  else if (c > 0)  puts("a es mas grande");
  else             puts("a es mas chico");
  return 0;
}
