#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
  int maxLength = 20;
  char str[maxLength+1];  // +1 for null terminator
  int i;

  printf("Enter a string (max %d characters): ", maxLength);
  fgets(str, maxLength+1, stdin);  // read at most maxLength characters
  str[strcspn(str, "\n")] = '\0';  // remove trailing newline, if any

  for (i = 0; str[i] != '\0'; i++) {
    if (str[i] != ',') {
      str[i] = toupper(str[i]);
    }
  }

  printf("%s\n", str);
  return 0;
}
