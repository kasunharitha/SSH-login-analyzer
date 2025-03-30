# SSH-login-analyzer
This analyzer will check for failed SSH login attempts to a server and will notify admins via emails.


SSH Login Analyzer
A simple yet effective SSH login monitoring tool that analyzes system logs, detects failed login attempts, and alerts administrators about suspicious activities.

Features
✅ Tracks SSH login attempts from system logs
✅ Detects failed logins & brute force attacks
✅ Identifies suspicious IP addresses
✅ Sends alerts to administrators via email
✅ Generates log summaries & reports

Prerequisites
Ensure you have the following:

Linux-based system (Ubuntu, Debian, CentOS, etc.)
Bash shell (default on most Linux systems)
Postfix or Sendmail (for email alerts)
Crontab (for automation)

Installation
1️⃣ Clone the Repository
git clone https://github.com/yourusername/ssh-login-analyzer.git
cd ssh-login-analyzer
2️⃣ Set Execute Permissions
chmod +x extract_logs.sh save_logs.sh analyze_attempts.sh notify_admin.sh
3️⃣ Configure Email Alerts (Optional)
Edit the notify_admin.sh script and update your email address:

ADMIN_EMAIL="your-email@example.com"
4️⃣ Set Up Cron Jobs for Automation
Run crontab -e and add the following lines to schedule the scripts:


* * * * * /path/to/extract_logs.sh  # Runs every minute
* * * * * /path/to/save_logs.sh  # Runs every minute
*/5 * * * * /path/to/analyze_attempts.sh  # Runs every 5 minutes
*/10 * * * * /path/to/notify_admin.sh  # Runs every 10 minutes
Save and exit the crontab editor.

Usage:
Manually Running the Scripts
If you want to test the scripts manually, run:

./extract_logs.sh  
./save_logs.sh  
./analyze_attempts.sh  
./notify_admin.sh  

Viewing SSH Login Attempts:
To check the logs manually, use:
cat /var/log/auth.log | grep "sshd"

Checking Detected Attacks:
The script will save logs in /var/log/ssh_analyzer.log. View them using:
cat /var/log/ssh_analyzer.log
