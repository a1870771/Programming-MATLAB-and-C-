#include <stdio.h>
#include <stdlib.h>

int main(void) {
  int n;
  int oddCount = 0;
  int evenCount = 0;

  printf("Enter the number of integers: ");  // get total number of integers
  scanf("%d", &n);

  int* nums = (int*)malloc(n * sizeof(int));

  printf("Enter the integers: ");  // read integer list and count odds/evens
  for (int i = 0; i < n; i++) {
    scanf("%d", &nums[i]);
    if (nums[i] % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }

  int* odds = (int*)malloc(oddCount * sizeof(int));
  int* evens = (int*)malloc(evenCount * sizeof(int));

  int oddIndex = 0, evenIndex = 0;

  for (int i = 0; i < n; i++) {
    if (nums[i] % 2 == 0) {
      evens[evenIndex] = nums[i];
      evenIndex++;
    } else {
      odds[oddIndex] = nums[i];
      oddIndex++;
    }
  }

  for (int i = 0; i < oddCount; i++) {  // print odds
    printf("%d ", odds[i]);
  }
  printf("\n");

  for (int i = 0; i < evenCount; i++) {  // print evens
    printf("%d ", evens[i]);
  }
  printf("\n");

  free(nums);
  free(evens);
  free(odds);
  return 0;
}