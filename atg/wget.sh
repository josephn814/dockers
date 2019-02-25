#!/bin/sh

#
# Generated onSun Feb 24 17:42:30 PST 2019# Start of user configurable variables
#
LANG=C
export LANG

# SSO username and password
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


$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V980662-01.zip&token=bXFKS1hWSGlTNGJFVFFTc1FKMHlDZyE6OiFmaWxlSWQ9MTAyNjU2NzE2JmZpbGVTZXRDaWQ9ODkwNjE1JnJlbGVhc2VDaWRzPTgzMjU3NCZwbGF0Zm9ybUNpZHM9MzUmZG93bmxvYWRUeXBlPTk1NzY0JmFncmVlbWVudElkPTUyNTAzODUmZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZ1c2VyTmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJmlwQWRkcmVzcz0xODIuMTUwLjI0LjcxJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoWDExOyBMaW51eCB4ODZfNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83Mi4wLjM2MjYuMTE5IFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz04OTA4MzI" -O $OUTPUT_DIR/V980662-01.zip 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V980682-01.zip&token=aTdDTFEvZyswNlRIK2VSZHQvTmc4USE6OiFmaWxlSWQ9MTAyNjU2OTc3JmZpbGVTZXRDaWQ9ODkwNjE4JnJlbGVhc2VDaWRzPTgzMjU5MSZwbGF0Zm9ybUNpZHM9MzUmZG93bmxvYWRUeXBlPTk1NzY0JmFncmVlbWVudElkPTUyNTAzODUmZW1haWxBZGRyZXNzPWpjbGFya0Bmb3htYWlsLmNvbSZ1c2VyTmFtZT1FUEQtSkNMQVJLQEZPWE1BSUwuQ09NJmlwQWRkcmVzcz0xODIuMTUwLjI0LjcxJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoWDExOyBMaW51eCB4ODZfNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS83Mi4wLjM2MjYuMTE5IFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz04OTA4MzI" -O $OUTPUT_DIR/V980682-01.zip 

