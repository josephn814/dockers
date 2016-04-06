#!/bin/sh

#
# Generated onWed Apr 06 08:31:12 PDT 2016# Start of user configurable variables
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
LOGDIR=.
LOGFILE=$LOGDIR/wgetlog-`date +%m-%d-%y-%H:%M`.log
# Output directory and file
OUTPUT_DIR=.
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




  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V46095-01_1of2.zip&token=L3RkdzM4Wk50S2Rzbll6SzBWd1IzZyE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzIxNjI4ODEmYXJ1PTE3ODQxNzUxJmFncmVlbWVudElkPTEzMDA3MDAmc29mdHdhcmVDaWRzPTE3NDIxMSZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU1MTk1NSZtZWRpYUNpZD0yMjkzNjMmcmVsZWFzZUNpZD0" -O $OUTPUT_DIR/V46095-01_1of2.zip >> $LOGFILE 2>&1 



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V46095-01_2of2.zip&token=eXQxOGZlSnM0YzNsUU14OU5MN3pwQSE6OiF1c2VybmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJnVzZXJJZD03NTg0MTk4JmNhbGxlcj1TZWFyY2hTb2Z0d2FyZSZjb3VudHJ5SWQ9Q04mZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZmaWxlSWQ9NzIxNjI4OTEmYXJ1PTE3ODQxNzUxJmFncmVlbWVudElkPTEzMDA3MDAmc29mdHdhcmVDaWRzPTE3NDIxMSZwbGF0Zm9ybUNpZHM9MzUmcHJvZmlsZUluc3RhbmNlQ2lkPTU1MTk1NSZtZWRpYUNpZD0yMjkzNjMmcmVsZWFzZUNpZD0" -O $OUTPUT_DIR/V46095-01_2of2.zip >> $LOGFILE 2>&1 

