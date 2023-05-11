#include <stdio.h>

int main(void) {
  int nums[11] = {11, 3, 9, 7, 6, 10, 13, 17, 2, 8, 3};
  int evens[11], odds[11];
  int even_count = 0, odd_count = 0;

  for (int i = 0; i < 11; i++) {
    if (nums[i] % 2 == 0) {
      evens[even_count] = nums[i];
      even_count++;
    } else {
      odds[odd_count] = nums[i];
      odd_count++;
    }
  }

  // print odds
  for (int i = 0; i < odd_count; i++) {
    printf("%d ", odds[i]);
  }
  printf("\n");

  // print evens
  for (int i = 0; i < even_count; i++) {
    printf("%d ", evens[i]);
  }
  printf("\n");

  return 0;
}