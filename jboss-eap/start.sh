#!/usr/bin/env bash

if [ "x$JAVA_HOME" = "x" ]; then
    JAVA_HOME=/opt/jdk1.7.0_80
fi
export JAVA_HOME
JBOSS_HOME=/opt/jboss-eap-6.1 ; export JBOSS_HOME
PATH=$JAVA_HOME/bin:$JBOSS_HOME/bin:$PATH ; export PATH

if [ "`ls -A $JBOSS_HOME`" = "" ]; then
    unzip /installer/jboss-eap.zip -d /opt
    chown -R developer:developer $JBOSS_HOME
fi

rm -rf $JBOSS_HOME/standalone/data/*
rm -rf $JBOSS_HOME/standalone/tmp/*

case "$1" in
    '')
        su developer -c "$JBOSS_HOME/bin/standalone.sh -h"
		;;
	*)
		echo "Container is starting......."
		su developer -c "$JBOSS_HOME/bin/standalone.sh $@"
		;;
esac