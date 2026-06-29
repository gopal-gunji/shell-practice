#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/backup.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #14 Days is default value, if user not provided

if [ $USERID -ne 0 ]; then 
    echo -e "$R please run this script with root user access $N" 
    exit 1
fi

mkdir -p $LOGS_FOLDER
echo -e "$R login with root access and LOGS_FOLDER created $N" | tee -a $LOG_FILE

USAGE(){
    echo -e " $R USAGE:: sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N "
    exit 1
}
log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE 
}

if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then 
    echo -e  "$R Source Directory: #SOURCE_DIR does not exist $N "
    exit 1
fi

if [ ! -d $DEST_DIR ]; then 
    echo -e  "$R Source Directory: #DEST_DIR does not exist $N "
    exit 1
fi

### find the file 

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup started "
log "Source Directory : $SOURCE_DIR"
log "Destination Directory : $DEST_DIR"
log "Days: $DAYS"

if [ -z ${FILES} ]; then
    log "No files to archieve ... $Y Skipping $N"
else
    # app-logs- time stamp
    log "Files found to archive: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Archieve name: $ZIP_FILE_NAME"
fi