#!/bin/bash

set -e

trap "echo 'An error occurred. Exiting...'; exit 1" ERR

echo "This is a trap command example"
echo " hello world"
echpp "print error"
echo "no error here"
