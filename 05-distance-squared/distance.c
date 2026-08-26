#include <stdio.h>

int square(int n) {
  return n * n;
}

int D2(int x1, int y1, int x2, int y2) {
  int a = x2 - x1;
  int b = y2 - y1;
  return square(a) + square(b);
}

int main(int argc, char *argv[]) {
  int a = 12, b = 3;
  int c =  5, d = 8;
  printf("La distancia al cuadrado entre los puntos (%d,%d) y (%d,%d) es %d\n",a,b,c,d,D2(a,b,c,d));
  return 0;
}
