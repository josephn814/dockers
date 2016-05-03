#!/bin/sh

#
# Generated onTue May 03 03:04:32 PDT 2016# Start of user configurable variables
#
LANG=C
export LANG

# SSO username and password
#read -p 'SSO User Name:' SSO_USERNAME
#read -sp 'SSO Password:' SSO_PASSWORD
SSO_USERNAME=jclark@foxmail.com
SSO_PASSWORD=123abcABC

# Path to wget command
WGET=/usr/bin/wget
# Location of cookie file
COOKIE_FILE=/tmp/$$.cookies

# Log directory and file
LOGDIR=/tmp
LOGFILE=$LOGDIR/wgetlog-`date +%m-%d-%y-%H:%M`.log
# Output directory and file
OUTPUT_DIR=/tmp
#
# End of user configurable variable
#

if [ "$SSO_PASSWORD " = " " ]
then
 echo "Please edit script and set SSO_PASSWORD"
 exit
fi

# Contact osdc site so that we can get SSO Params for logging in
SSO_RESPONSE=`$WGET --user-agent="Mozilla/5.0" --no-check-certificate https://edelivery.oracle.com/osdc/faces/SearchSoftware 2>&1|grep Location`

# Extract request parameters for SSO
SSO_TOKEN=`echo $SSO_RESPONSE| cut -d '=' -f 2|cut -d ' ' -f 1`
SSO_SERVER=`echo $SSO_RESPONSE| cut -d ' ' -f 2|cut -d '/' -f 1,2,3`
SSO_AUTH_URL=/sso/auth
AUTH_DATA="ssousername=$SSO_USERNAME&password=$SSO_PASSWORD&site2pstoretoken=$SSO_TOKEN"

# The following command to authenticate uses HTTPS. This will work only if the wget in the environment
# where this script will be executed was compiled with OpenSSL. Remove the --secure-protocol option
# if wget was not compiled with OpenSSL
# Depending on the preference, the other options are --secure-protocol= auto|SSLv2|SSLv3|TLSv1
$WGET --user-agent="Mozilla/5.0" --post-data $AUTH_DATA --save-cookies=$COOKIE_FILE --keep-session-cookies $SSO_SERVER$SSO_AUTH_URL -O sso.out >> $LOGFILE 2>&1

rm -f sso.out




  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V45986-01.zip&token=eHZrR3hsNXgxNUpMNEc0aEV4elBNUSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzE5MzU3MjYmYXJ1PTE3ODA3NzUyJmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9MjIyNjcyJnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V45986-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V45987-01.zip&token=TzAzbitJMHRnb201RlZiYjh0dnRDQSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzE5MzU3MjcmYXJ1PTE3ODA3NzUzJmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9MjIyNjczJnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V45987-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V46005-01.zip&token=ejMyMEZBbkVFS2NHMi9kUi9nbGdXUSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzE5MzY0NzkmYXJ1PTE3ODA3NzcwJmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9MjIyNjk0JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V46005-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V46007-01.zip&token=amFuNGxWRmhYSCtHcEVHS3VpZTM0dyE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzE5MzY0ODEmYXJ1PTE3ODA3OTMyJmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9MjIyNzQ2JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V46007-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V74842-01.zip&token=QWJlS1VZQ2FFNmE4UVZUNERkQXhDQSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzgwMzIzOTkmYXJ1PTE4Njg4NDI5JmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9MzM2OTY4JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V74842-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V77159-01.zip&token=SFIvdzVla3BlNGJXcDZXRUx2Z2JKZyE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODEzMDQxNTgmYXJ1PTE5MTczOTgwJmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NDE0OTcxJnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V77159-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V46993-01.zip&token=bEdOT0pOUTVpVldIMFM0QmNZK1ZZUSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzM2MzgyNzImYXJ1PTE4MDQzNzQ0JmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9MjUxOTEzJnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V46993-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V75744-01.zip&token=eHJOaFBEZi9BV0dLa1RzMGJjb1B6USE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzkzMTA2MzgmYXJ1PTE4ODU5MzM1JmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9MzUzNjM3JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V75744-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V46994-01.zip&token=a0RDZW5zYStKWWVXYktoTTRKNEJrQSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzM2MzgyNzkmYXJ1PTE4MDQzNzQ1JmFncmVlbWVudElkPTE0Mjc1MDUmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTQxNjExMyZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMS4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9MjUxOTE0JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V46994-01.zip >> $LOGFILE 2>&1
