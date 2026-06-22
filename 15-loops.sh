#!/bin/bash


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then 
    echo " please run this script with root user access" | tee -a $LOG_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 ....failed" | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 ....success" | tee -a $LOG_FILE
    fi
}


for package in $@  # input sudo sh 14-loops.sh nginx mysql nodejs php 
do 
  dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now ..."
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "$package Installation
    else 
        echo "$package is already installed"
    fi
done


