#!/bin/bash

LOG_FILE="failed_attempts.log"


#run the extract_logs.sh file to get the latest data
./extract_logs.sh

#append the extracted data into the main log file
cat  failed_attempts.txt >> "$LOG_FILE"
echo "" >>  "$LOG_FILE"

echo "Failed login attempts saved to $LOG_FILE"

