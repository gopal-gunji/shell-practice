#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo " please run this script with root user access"
    exit 1
fi

echo "installing Nginx web server"
dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "Installing Nginx web server failed"
    exit 1
else
    echo "Nginx web server installed successfully"
fi
