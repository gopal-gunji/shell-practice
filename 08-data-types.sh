#!/bin/bash

NUM1=100
NUM2=sivakumar

SUM=$(($NUM1 + $NUM2))
echo "The sum of $NUM1 and $NUM2 is: $SUM"
echo "Sume is : $SUM"

#Array declaration
FRUITS=("apple" "banana" "promogranate" "grapes")

echo " Fruits are : ${FRUITS[@]}"
echo "First fruit is : ${FRUITS[0]}"
echo "Second fruit is : ${FRUITS[1]}"
echo "Third fruit is : ${FRUITS[2]}"
echo "Fourth fruit is : ${FRUITS[3]}"       