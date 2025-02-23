#!/bin/sh

# Define your function here
Hello() {
  ret="Hello World $1 $2"
  return "$ret"
}

# Invoke your function
Hello Zara Ali

# Capture value returnd by last command
# ret=$?

echo "Return value is $ret"
