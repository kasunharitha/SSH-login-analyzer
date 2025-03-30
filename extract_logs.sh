#!/bin/bash

grep "Failed password" /var/log/auth.log | awk '{print $1, $2, $3, $9, $11}' > failed_attempts.txt

cat failed_attempts.txt
