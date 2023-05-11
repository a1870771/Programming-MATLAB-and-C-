#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  char str[20];
  int i;

  printf("Enter a string (max 20 characters): ");
  scanf("%20s", str);

  for (i = 0; i < 20; i++) {
    str[i] = toupper(str[i]);
  }

  printf("%s\n", str);
  return 0;
}