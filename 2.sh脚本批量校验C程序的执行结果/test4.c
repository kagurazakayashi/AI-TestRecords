#include <stdio.h>
#include <string.h>

int main() {
  FILE *fp;
  char str[] = "Hello, World!";

  fp = fopen("helloworld.txt", "w");
  if (fp == NULL) {
    perror("fopen");
    return 1;
  }

  fwrite(str, sizeof(char), strlen(str), fp);

  fclose(fp);

  return 0;
}