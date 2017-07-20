#!/bin/sh

#
# Generated onWed Jul 19 20:08:07 PDT 2017# Start of user configurable variables
#
LANG=C
export LANG

# SSO username and password
SSO_USERNAME=josephn814@foxmail.com
SSO_PASSWORD=112233qq




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
$WGET --user-agent="Mozilla/5.0" --secure-protocol=auto --post-data $AUTH_DATA --save-cookies=$COOKIE_FILE --keep-session-cookies $SSO_SERVER$SSO_AUTH_URL -O sso.out >> $LOGFILE 2>&1

rm -f sso.out




  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V861194-01.zip&token=RnFyMVg3RytySnRvZWdaMG13UjJKQSE6OiF1c2VybmFtZT1FUEQtSk9TRVBITjgxNEBGT1hNQUlMLkNPTSZ1c2VySWQ9NTM0OTA4NCZjYWxsZXI9U2VhcmNoU29mdHdhcmUmY291bnRyeUlkPUNOJmVtYWlsQWRkcmVzcz1qb3NlcGhuODE0QGZveG1haWwuY29tJmZpbGVJZD05NDIwMDk0NCZhcnU9MjEyMDgxNzMmYWdyZWVtZW50SWQ9MzQ1NjE4NSZzb2Z0d2FyZUNpZHM9MTAxODMyJnBsYXRmb3JtQ2lkcz0zNSZwcm9maWxlSW5zdGFuY2VDaWQ9NzgzMjc0JmRvd25sb2FkU291cmNlPXdnZXQmcHJvZmlsZUluc3RhbmNlTmFtZT1PcmFjbGUgQVRHIFdlYiBDb21tZXJjZSAxMS4zLjAuMC4wIGZvciBMaW51eCB4ODYtNjQmcGxhdGZvcm1OYW1lPUxpbnV4IHg4Ni02NCZtZWRpYUNpZD03Nzk4NDMmcmVsZWFzZUNpZD0maXNSZWxlYXNlU2VhcmNoPWZhbHNl" -O $OUTPUT_DIR/V861194-01.zip >> $LOGFILE 2>&1 



  $WGET  --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/download?fileName=V861209-01.zip&token=T2ZQTTRUWVEvbGl2d3pmY1llcmEwZyE6OiF1c2VybmFtZT1FUEQtSk9TRVBITjgxNEBGT1hNQUlMLkNPTSZ1c2VySWQ9NTM0OTA4NCZjYWxsZXI9U2VhcmNoU29mdHdhcmUmY291bnRyeUlkPUNOJmVtYWlsQWRkcmVzcz1qb3NlcGhuODE0QGZveG1haWwuY29tJmZpbGVJZD05NDIwMTQ4NyZhcnU9MjEyMDgyODAmYWdyZWVtZW50SWQ9MzQ1NjE4NSZzb2Z0d2FyZUNpZHM9MTAxODMyJnBsYXRmb3JtQ2lkcz0zNSZwcm9maWxlSW5zdGFuY2VDaWQ9NzgzMjc0JmRvd25sb2FkU291cmNlPXdnZXQmcHJvZmlsZUluc3RhbmNlTmFtZT1PcmFjbGUgQVRHIFdlYiBDb21tZXJjZSAxMS4zLjAuMC4wIGZvciBMaW51eCB4ODYtNjQmcGxhdGZvcm1OYW1lPUxpbnV4IHg4Ni02NCZtZWRpYUNpZD03Nzk4ODQmcmVsZWFzZUNpZD0maXNSZWxlYXNlU2VhcmNoPWZhbHNl" -O $OUTPUT_DIR/V861209-01.zip >> $LOGFILE 2>&1 

