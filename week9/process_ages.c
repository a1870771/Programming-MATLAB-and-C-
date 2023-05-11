#include <stdio.h>
#include <stdbool.h>

int main() {
  int ages[10], age, max = 0, min = 150, sum = 0, i;
  double mean;
  bool reading = true;
  printf("Enter up to 10 ages, then press enter (-1 to terminate early): ");
  for (i = 0; i < 10; i++) {
    scanf("%d", &age);
    if (age == -1) {
      break;
    }
    else if (age < 0 || age > 150) {
      printf("Enter a valid age.");
    }
    else {
      ages[i] = age;
      sum += age;
      if (age > max) {
        max = age;
      }
      if (age < min) {
        min = age;
      }
    }
  }
  mean = sum / i;
  printf("%d %d %.1f", max, min, mean);
  return 0;
}
