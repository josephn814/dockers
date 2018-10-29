#!/bin/sh

#
# Generated onMon Oct 29 02:52:01 PDT 2018# Start of user configurable variables
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


$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V861198-01.zip&token=aE1GYnR2aU5uYmkxZy9PQm9PZENzUSE6OiFmaWxlSWQ9OTQyMDEzNzMmZmlsZVNldENpZD04MTc1NzMmcmVsZWFzZUNpZHM9NTg0MTU2JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NDkyNTAyMCZlbWFpbEFkZHJlc3M9am9zZXBobjgxNEBmb3htYWlsLmNvbSZ1c2VyTmFtZT1FUEQtSk9TRVBITjgxNEBGT1hNQUlMLkNPTSZpcEFkZHJlc3M9MTgyLjE1MC4yNC43MSZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNzAuMC4zNTM4Ljc3IFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz04MjU3MTE" -O $OUTPUT_DIR/V861198-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V861200-01.zip&token=STM4U3NQUnZtcWlYMytac1FOV3BidyE6OiFmaWxlSWQ9OTQyMDE0NjImZmlsZVNldENpZD04MTc1ODImcmVsZWFzZUNpZHM9NTg0MTc2JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NDkyNTAyMCZlbWFpbEFkZHJlc3M9am9zZXBobjgxNEBmb3htYWlsLmNvbSZ1c2VyTmFtZT1FUEQtSk9TRVBITjgxNEBGT1hNQUlMLkNPTSZpcEFkZHJlc3M9MTgyLjE1MC4yNC43MSZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNzAuMC4zNTM4Ljc3IFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz04MjU3MTE" -O $OUTPUT_DIR/V861200-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V861203-01.zip&token=WWRBZkE3dTdBQzYzR25EdWxZRloyZyE6OiFmaWxlSWQ9OTQyMDE0NzAmZmlsZVNldENpZD04MTc1NjUmcmVsZWFzZUNpZHM9NTg0MTU5JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NDkyNTAyMCZlbWFpbEFkZHJlc3M9am9zZXBobjgxNEBmb3htYWlsLmNvbSZ1c2VyTmFtZT1FUEQtSk9TRVBITjgxNEBGT1hNQUlMLkNPTSZpcEFkZHJlc3M9MTgyLjE1MC4yNC43MSZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNzAuMC4zNTM4Ljc3IFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz04MjU3MTE" -O $OUTPUT_DIR/V861203-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V861206-01.zip&token=SkszSVlIbCtHNjFSeG5zM2JsMWxDdyE6OiFmaWxlSWQ9OTQyMDE0NTQmZmlsZVNldENpZD04MTc1MjEmcmVsZWFzZUNpZHM9NzUzMTM2JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NDkyNTAyMCZlbWFpbEFkZHJlc3M9am9zZXBobjgxNEBmb3htYWlsLmNvbSZ1c2VyTmFtZT1FUEQtSk9TRVBITjgxNEBGT1hNQUlMLkNPTSZpcEFkZHJlc3M9MTgyLjE1MC4yNC43MSZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNzAuMC4zNTM4Ljc3IFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9Q04mZGxwQ2lkcz04MjU3MTE" -O $OUTPUT_DIR/V861206-01.zip>> $LOGFILE 2>&1 

