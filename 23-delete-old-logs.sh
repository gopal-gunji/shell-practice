#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"
LOGS_DIR=/home/ec-2-user/app-logs
LOGS_FILE="$LOG_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then 
    echo -e "$LOGS_DIR does not exitst"
    exit 1
fi 

FILES_TO_DELETE=$($LOGS_DIR -name "*.log" -type f  -mtime +14)
echo "$FILES_TO_DELETE"