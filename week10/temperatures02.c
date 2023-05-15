#include <stdio.h>
#include <stdlib.h>

int main() {
  int capacity = 5;
  int size = 0;
  double *temps = malloc(capacity * sizeof(double));
  double temp;

  printf("Enter temperatures (type -100.0 to finish):\n");
  while (scanf("%lf", &temp) == 1 && temp != -100.0) {
    if (size == capacity) {
      double *new_temps = malloc(2 * capacity * sizeof(double));
      for (int i = 0; i < size; i++) {
        new_temps[i] = temps[i];
      }
      free(temps);
      temps = new_temps;
      capacity *= 2;
    }
    temps[size] = temp;
    size++;
  }

  for (int i = size - 1; i >= 0; i--) {
    printf("%.1f ", temps[i]);
  }

  free(temps);
  return 0;
}