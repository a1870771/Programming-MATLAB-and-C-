#include <stdio.h>
#include <stdlib.h>

int main() {
  int n;
  printf("Enter the number of temperatures: ");
  scanf("%d", &n);

  float* temps = (float*)malloc(n * sizeof(float));

  printf("Enter the temperatures: ");
  for (int i = 0; i < n; i++) {
    scanf("%f", &temps[i]);
  }

  for (int i = n - 1; i >= 0; i--) {
    printf("%.1f ", temps[i]);
  }
  printf("\n"); 

  free(temps);
  return 0;
}