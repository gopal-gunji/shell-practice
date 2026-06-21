#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0]; then 
    echo " please run this script with root user access"

fi

echo "installing Nginx web server"
dnf install nginx -y