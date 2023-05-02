#include <math.h>
#include <stdio.h>

int main(void) {
  int num;
  printf("enter a positive three-digit integer: ");
  scanf("%d", &num);
  printf("%d\n%d\n%d\n", num % 10, num / 10 % 10, num / 100 % 10);
  return 0;
}