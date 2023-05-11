#include <stdio.h>

int main(void) {
  int ages[10];
  int num_ages = 0;
  int age_sum = 0;
  int max_age = 0;
  int min_age = 150;  // max possible age
  int age;

  printf("Enter up to %d ages, or -1 to stop:\n", 10);
  while (num_ages < 10) {
    scanf("%d", &age);
    if (age == -1) {
      break;
    } else if (age < 0 || age > 150) {
      printf("Invalid age. Please enter a valid age:\n");
      continue;
    }
    ages[num_ages++] = age;
    age_sum += age;
    if (age > max_age) {
      max_age = age;
    }
    if (age < min_age) {
      min_age = age;
    }
  }

  printf("%d %d %.1f\n", max_age, min_age, (float)age_sum / num_ages);
  return 0;
}