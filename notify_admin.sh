#!/bin/bash

LOG_FILE="failed_attempts.log"
EMAIL="youremial@domain.com"
SUBJECT="SSH Login Attack Report - $(date '+%a %d %b %H:%M:%S %Z %Y')"

# Extract top attacked IPs (column 5)
TOP_IPS=$(awk '{print $5}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5)

# Extract top attacked usernames (column 4)
TOP_USERS=$(awk '{print $4}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5)

# Format email content
EMAIL_BODY="
SSH Failed Login Report

Date & Time: $(date '+%a %d %b %H:%M:%S %Z %Y')

Top Attacked IPs:  
$(echo "$TOP_IPS" | awk '{printf "  %-5s %s\n", $1, $2}')

Top Attacked Usernames:  
$(echo "$TOP_USERS" | awk '{printf "  %-5s %s\n", $1, $2}')

Full Log (Last 10 entries):  
$(tail -n 10 "$LOG_FILE")  
"

# Send Email
echo "$EMAIL_BODY" | mail -s "$SUBJECT" "$EMAIL"

