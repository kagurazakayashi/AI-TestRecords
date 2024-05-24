#include <stdio.h>

int main() {
  int i;
  char str[] = "Hello, World!";

  for (i = 0; str[i] != '\0'; i++) {
    putchar(str[i]);
  }

  return 0;
}