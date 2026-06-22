#!/bin/bash

set -e
trap 'echo "there is an error in $LINENO, command: $BASH_COMMAND"' ERR

echo "This is a trap command example"
echo " hello world"
echpp "print error"
echo "no error here"
