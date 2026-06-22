#!/bin/bash

set -e # this will be checking for errors, if error found it will exit 


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"

if [ $USERID -ne 0 ]; then 
    echo -e "$R please run this script with root user access $N" | tee -a $LOG_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R $2 ....failed $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$G $2 ....success $N" | tee -a $LOG_FILE
    fi
}

for package in $@ # input sudo sh 14-loops.sh nginx mysql nodejs php
do 
    dnf install $package -y &>> $LOG_FILE
    if [ $? -ne 0 ]; then 
        echo -e "$R $package not installed, Installing Now ... $N" | tee -a $LOG_FILE
        dnf install $package -y &>> $LOG_FILE
       # VALIDATE $? "$package Installation"
        else
            echo -e "$B $package is already installed $N, $Y skipping installation $N" | tee -a $LOG_FILE
        fi
    done
