#include <stdio.h>

int main(void) {
  int nums[11] = {11, 3, 9, 7, 6, 10, 13, 17, 2, 8, 3};
  int evens[11];
  int odds[11];
  for (int i = 0; i < 11; i++) {
    if (nums[i] % 2 == 0) {
      evens[i] = nums[i];
    }
    else {
      odds[i] = nums[i];
    }
  }
  
}