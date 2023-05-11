#include <stdio.h>
#include <string.h>

int main(void) {

  char firstname[5];
  char lastname[5];
  char fullname[20] = "";  // initialise with empty string

  int count = scanf("%s %s", firstname, lastname);

  strcat(fullname, firstname);
  strcat(fullname, " ");
  strcat(fullname, lastname);

  printf("%s\n", fullname);

  return 0;
}
