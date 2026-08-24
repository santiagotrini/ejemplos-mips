#include <stdio.h>

int g(int x, int y) { return x + y; }
int h(int x)        { return x * x; }
int i(int x, int y) { return x * y; }

int f(int x, int y) {
  if (x < 0)  return g(x,y);
  if (x == y) return h(x);
  if (y > x)  return i(x,y);
  return -12;
}

int main(void) {
  int x = 8, y = 12;
  printf("%d\n", f(x,y));
  return 0;
}


