#include <stdio.h>
#include <string.h>

int main(void) {
  char str[20];
  printf("Enter a string (20 characters or less): ");
  scanf("%20s", str);

  int len = strlen(str);
  for (int i = 0; i < len / 2; i++) {
    char temp = str[i];
    str[i] = str[len - 1 - i];
    str[len - 1 - i] = temp;
  }

  printf("%s\n", str);
  return 0;
}