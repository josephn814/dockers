#!/bin/sh

#
# Generated onTue May 03 02:56:28 PDT 2016# Start of user configurable variables
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




  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V78201-01.zip&token=dmEvalBWQmplekR0NVVnaG9pbEVoQSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODI4NTA1NTkmYXJ1PTE5NDI1MDEzJmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NDYyMDc2JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V78201-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V78203-01.zip&token=U2Y2VWpUQ3NUazBaa1hHNW1SaENXUSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODI4NTE5NjUmYXJ1PTE5NDI1MjczJmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NDYyMTM2JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V78203-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V78217-01.zip&token=aDMyL3R6Nm9vbThjTjFCeW00R1NHdyE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODI4NTM1NjImYXJ1PTE5NDI1NDk2JmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NDYyMzE3JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V78217-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V78224-01.zip&token=SGxXQlVTU3VYSjBnenk3VTM4Q3Y3dyE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODI4NTM5MzQmYXJ1PTE5NDI1NjM3JmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NDYyMzc3JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V78224-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V100746-01.zip&token=WnIybkpEZHFtUEZnMjM1KzZtdSsyUSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODUyNjk5OTQmYXJ1PTE5NzkzNDk2JmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NTM2ODU2JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V100746-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V100779-01.zip&token=WWhMOC8rOTZLM2lRRUhLQm9RRkUzUSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODUzNTAyMzMmYXJ1PTE5ODAzMjE2JmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NTM4NDU2JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V100779-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V100780-01.zip&token=TDJNdnFLTzl2RkJaQU0vbVFzeXB4ZyE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODUzNTAyMzQmYXJ1PTE5ODAzMjE3JmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NTM4NDU3JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V100780-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V100781-01.zip&token=emI2OVlHQ3FyTytpMm9LSG9ETW0wQSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODUzNTAyNDEmYXJ1PTE5ODAzMjE4JmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NTM4NDU4JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V100781-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V100782-01.zip&token=RmhldW54eXpmSk1CMFl5MTBidHhEdyE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODUzNTAyNDImYXJ1PTE5ODAzMjE5JmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NTM4NDU5JnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V100782-01.zip >> $LOGFILE 2>&1



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V100783-01.zip&token=dVA3bXRsbkJJWXZkc1N6djV2eGFxZyE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9ODUzNTAyMTEmYXJ1PTE5ODAzMjIwJmFncmVlbWVudElkPTE0Mjc0NTkmc29mdHdhcmVDaWRzPTEwMTgzMiZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU0MDM4MiZkb3dubG9hZFNvdXJjZT13Z2V0JnByb2ZpbGVJbnN0YW5jZU5hbWU9T3JhY2xlIEFURyBXZWIgQ29tbWVyY2UgMTEuMi4wLjAuMCBmb3IgTGludXggeDg2LTY0JnBsYXRmb3JtTmFtZT1MaW51eCB4ODYtNjQmbWVkaWFDaWQ9NTM4NDYwJnJlbGVhc2VDaWQ9JmlzUmVsZWFzZVNlYXJjaD1mYWxzZQ" -O $OUTPUT_DIR/V100783-01.zip >> $LOGFILE 2>&1
