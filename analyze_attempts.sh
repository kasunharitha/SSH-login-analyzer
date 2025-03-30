#!/bin/bash

LOG_FILE="failed_attempts.log"

#sorting the failed attempts by IP
echo "Top failed attempts by IP:"
awk '{print $5}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

#listing the usernames who got attecked
awk '{print $4}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

