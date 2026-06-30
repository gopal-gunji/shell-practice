#!/bin/bash
TO_ADDRESS=$1
SUBJECT=$2
MESSAGE_BODY=$3
ALERT_TYPE=$4
SERVER_IP=$5
TO_TEAM=$6

FINAL_MESSAGE=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/g" -e "s/SERVER_IP/$SERVER_IP" -e "s/MESSAGE_BODY/g" templete.html)

{
echo "To: gopalakrishna.gunji@gmail.com"
echo "Subject: Shell Scripting Testing "
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MESSAGE"
} | msmtp "gopalakrishna.gunji@gmail.com"