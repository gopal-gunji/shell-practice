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


echo "installing Nginx web server"
dnf install nginx -y &>> $LOG_FILE
VALIDATE $? "Nginx Installation"

echo "installing MySQL database server"
dnf install mysql -y &>> $LOG_FILE
VALIDATE $? "MySQL Installation"

echo "installing php"
dnf install php -y &>> $LOG_FILE
VALIDATE $? "PHP Installation"

echo "installing nodejs"
dnf install nodejs -y &>> $LOG_FILE
VALIDATE $? "NodeJS Installation"



