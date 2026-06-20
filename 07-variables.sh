#!/bin/bash

#### special variables ####

echo "All args passed to script : $@"
echo "Number of vars passed to script : $#"
echo "Script name : $0"
echo " Present Directory : $PWD"
echo "Who is running the script : $USER"
echo " Home Directory of current user : $HOME"
echo "PID of thids script is : $$"

sleep 100 &
echo "PID of recently ec=xecuted background process is : $!"
echo "All args passed to script : $*"
