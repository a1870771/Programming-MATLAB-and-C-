#include <stdio.h>

int main(void) {
  int x=0;
  printf("enter a number and I'll double it: ");
  scanf("%d", &x);
  printf("twice %d is %d\n", x, 2*x);
  return 0;
}