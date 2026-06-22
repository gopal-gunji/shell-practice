#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo " please run this script with root user access"
    exit 1
fi


VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 ....failed"
        exit 1
    else
        echo "$2 ....success"
    fi
}


echo "installing Nginx web server"
dnf install nginx -y
VALIDATE $? "Nginx Installation"

echo "installing MySQL database server"
dnf install mysql -y
VALIDATE $? "MySQL Installation"

echo "installing php"
dnf install php -y
VALIDATE $? "PHP Installation"

echo "installing nodejs"
dnf install nodejs -y
VALIDATE $? "NodeJS Installation"



