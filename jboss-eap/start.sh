#!/usr/bin/env bash

if [ "x$JAVA_HOME" = "x" ]; then
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi
export JAVA_HOME
JBOSS_HOME=/opt/jboss-eap-7.0 ; export JBOSS_HOME
PATH=$JAVA_HOME/bin:$JBOSS_HOME/bin:$PATH ; export PATH

if [ "`ls -A $JBOSS_HOME`" = "" ]; then
    unzip /installer/jboss-eap.zip -d /opt
    chown -R developer:developer $JBOSS_HOME
fi

case "$1" in
    '')
	trap 'shutdown' INT TERM
        echo "Container Started."
		while [ "$END" == '' ]; do
			sleep 1
		done
		;;
     *)
	echo "Container is starting......."
	$@
	;;
esac
