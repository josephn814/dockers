#!/bin/sh

#
# Generated onFri Apr 06 08:58:55 PDT 2018# Start of user configurable variables
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

SSO_RESPONSE=`$WGET --user-agent="Mozilla/5.0"  --no-check-certificate https://edelivery.oracle.com/osdc/faces/SoftwareDelivery -O- 2>&1|grep Location`

# Extract request parameters for SSO
SSO_TOKEN=`echo $SSO_RESPONSE| cut -d '=' -f 2|cut -d ' ' -f 1`
SSO_SERVER=`echo $SSO_RESPONSE| cut -d ' ' -f 2|cut -d '/' -f 1,2,3`
SSO_AUTH_URL=/sso/auth
AUTH_DATA="ssousername=$SSO_USERNAME&password=$SSO_PASSWORD&site2pstoretoken=$SSO_TOKEN"

# The following command to authenticate uses HTTPS. This will work only if the wget in the environment
# where this script will be executed was compiled with OpenSSL. Remove the --secure-protocol option
# if wget was not compiled with OpenSSL
# Depending on the preference, the other options are --secure-protocol= auto|SSLv2|SSLv3|TLSv1
$WGET --user-agent="Mozilla/5.0" --secure-protocol=auto --post-data $AUTH_DATA --save-cookies=$COOKIE_FILE --keep-session-cookies $SSO_SERVER$SSO_AUTH_URL -O sso.out >> $LOGFILE 2>&1

rm -f sso.out


$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V46393-01.zip&token=Mzl4Yjh1YURzWkdneTczS0h6UVMvZyE6OiFmaWxlSWQ9NzI0MjgyNTkmZmlsZVNldENpZD03NzkzMTEmcmVsZWFzZUNpZHM9MjIyNTkyJnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjQmYWdyZWVtZW50SWQ9NDMyNzAzNyZlbWFpbEFkZHJlc3M9amNsYXJrQGZveG1haWwuY29tJnVzZXJOYW1lPUVQRC1KQ0xBUktARk9YTUFJTC5DT00maXBBZGRyZXNzPTExOS42LjkuMTgwJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoWDExOyBMaW51eCB4ODZfNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS82NS4wLjMzMjUuMTgxIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz03Nzg4OTA" -O $OUTPUT_DIR/V46393-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V46389-01.zip&token=WkJUejRtRXNZa2Y4dlk2MjlKTCtCUSE6OiFmaWxlSWQ9NzI0Mjc4ODMmZmlsZVNldENpZD03NzkzNDUmcmVsZWFzZUNpZHM9MjIyNTk4JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjQmYWdyZWVtZW50SWQ9NDMyNzAzNyZlbWFpbEFkZHJlc3M9amNsYXJrQGZveG1haWwuY29tJnVzZXJOYW1lPUVQRC1KQ0xBUktARk9YTUFJTC5DT00maXBBZGRyZXNzPTExOS42LjkuMTgwJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoWDExOyBMaW51eCB4ODZfNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS82NS4wLjMzMjUuMTgxIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz03Nzg4OTA" -O $OUTPUT_DIR/V46389-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V45999-01.zip&token=d3dwQW0vQ1FIb01yTTZKTjRvTkVzdyE6OiFmaWxlSWQ9NzE5MzY0NTcmZmlsZVNldENpZD03NzkzMzcmcmVsZWFzZUNpZHM9MjIyNTk2JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjQmYWdyZWVtZW50SWQ9NDMyNzAzNyZlbWFpbEFkZHJlc3M9amNsYXJrQGZveG1haWwuY29tJnVzZXJOYW1lPUVQRC1KQ0xBUktARk9YTUFJTC5DT00maXBBZGRyZXNzPTExOS42LjkuMTgwJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoWDExOyBMaW51eCB4ODZfNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS82NS4wLjMzMjUuMTgxIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz03Nzg4OTA" -O $OUTPUT_DIR/V45999-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V46002-01.zip&token=MFdQazVVU1RmQy9xa05NQ3BXNWY1QSE6OiFmaWxlSWQ9NzE5MzY0NjkmZmlsZVNldENpZD03NzkzNjUmcmVsZWFzZUNpZHM9MjIyNTk1JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjQmYWdyZWVtZW50SWQ9NDMyNzAzNyZlbWFpbEFkZHJlc3M9amNsYXJrQGZveG1haWwuY29tJnVzZXJOYW1lPUVQRC1KQ0xBUktARk9YTUFJTC5DT00maXBBZGRyZXNzPTExOS42LjkuMTgwJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoWDExOyBMaW51eCB4ODZfNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS82NS4wLjMzMjUuMTgxIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz03Nzg4OTA" -O $OUTPUT_DIR/V46002-01.zip>> $LOGFILE 2>&1 

