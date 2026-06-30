#!/bin/bash
TO_ADDRESS=$1
SUBJECT=$2
MESSAGE_BODY=$3
ALERT_TYPE=$4
SERVER_IP=$5
TO_TEAM=$6
FINAL_MESSAGE_BODY=$( echo $MESSAGE_BODY | sed -e 's/[]\/$*.^[]/\\&/g')

FINAL_MESSAGE=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/g" -e "s/SERVER_IP/$SERVER_IP" -e "s/FINAL_MESSAGE_BODY/g" templete.html)

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT "
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MESSAGE"
} | msmtp "$TO_ADDRESS"