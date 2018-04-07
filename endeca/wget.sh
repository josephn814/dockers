#!/bin/sh

#
# Generated onSat Apr 07 00:31:17 PDT 2018# Start of user configurable variables
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


$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V78204-01.zip&token=dS81anRtc3cxUzFqOUl6emErQVBJQSE6OiFmaWxlSWQ9ODI4NTIwNzcmZmlsZVNldENpZD03NzkzMzAmcmVsZWFzZUNpZHM9MzU0NTUxJnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjQmYWdyZWVtZW50SWQ9NDMyODM0NiZlbWFpbEFkZHJlc3M9amNsYXJrQGZveG1haWwuY29tJnVzZXJOYW1lPUVQRC1KQ0xBUktARk9YTUFJTC5DT00maXBBZGRyZXNzPTE3MS4yMjMuMTczLjI1MyZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNjUuMC4zMzI1LjE4MSBTYWZhcmkvNTM3LjM2JmNvdW50cnlDb2RlPUNOJmRscENpZHM9Nzc5NTIw" -O $OUTPUT_DIR/V78204-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V78229-01.zip&token=ZG9JV3RERE9GRUVHaTVxaTdPcVpGZyE6OiFmaWxlSWQ9ODI4NTQ3MjkmZmlsZVNldENpZD03NzkzNDMmcmVsZWFzZUNpZHM9MzU0NTU0JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjQmYWdyZWVtZW50SWQ9NDMyODM0NiZlbWFpbEFkZHJlc3M9amNsYXJrQGZveG1haWwuY29tJnVzZXJOYW1lPUVQRC1KQ0xBUktARk9YTUFJTC5DT00maXBBZGRyZXNzPTE3MS4yMjMuMTczLjI1MyZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNjUuMC4zMzI1LjE4MSBTYWZhcmkvNTM3LjM2JmNvdW50cnlDb2RlPUNOJmRscENpZHM9Nzc5NTIw" -O $OUTPUT_DIR/V78229-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V78226-01.zip&token=OVNXRk1yWThsU1pDWElLaVdLb3FDZyE6OiFmaWxlSWQ9ODI4NTQ1MTYmZmlsZVNldENpZD03NzkzMzYmcmVsZWFzZUNpZHM9MzU0NTU1JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjQmYWdyZWVtZW50SWQ9NDMyODM0NiZlbWFpbEFkZHJlc3M9amNsYXJrQGZveG1haWwuY29tJnVzZXJOYW1lPUVQRC1KQ0xBUktARk9YTUFJTC5DT00maXBBZGRyZXNzPTE3MS4yMjMuMTczLjI1MyZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNjUuMC4zMzI1LjE4MSBTYWZhcmkvNTM3LjM2JmNvdW50cnlDb2RlPUNOJmRscENpZHM9Nzc5NTIw" -O $OUTPUT_DIR/V78226-01.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V78211-01.zip&token=aXg3dUxPNndMZVkwQ1owNXFtYVZkZyE6OiFmaWxlSWQ9ODI4NTI2MTImZmlsZVNldENpZD03NzkzNjImcmVsZWFzZUNpZHM9MzU0NTU2JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjQmYWdyZWVtZW50SWQ9NDMyODM0NiZlbWFpbEFkZHJlc3M9amNsYXJrQGZveG1haWwuY29tJnVzZXJOYW1lPUVQRC1KQ0xBUktARk9YTUFJTC5DT00maXBBZGRyZXNzPTE3MS4yMjMuMTczLjI1MyZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKFgxMTsgTGludXggeDg2XzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNjUuMC4zMzI1LjE4MSBTYWZhcmkvNTM3LjM2JmNvdW50cnlDb2RlPUNOJmRscENpZHM9Nzc5NTIw" -O $OUTPUT_DIR/V78211-01.zip>> $LOGFILE 2>&1 

