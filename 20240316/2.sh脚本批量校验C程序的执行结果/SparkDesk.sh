#!/bin/sh
for file in *.c; do
  gcc -o $file $file
  if [ $? -eq 0 ]; then
    output=$(./$file)
    if [[ "$output" != *"\n" ]]; then
      output="$output\n"
    fi
    if [ "$output" = "Hello, World!\n" ]; then
      echo "OK: $file"
    else
      echo "FAIL: $file"
    fi
    rm $file
  fi
done
