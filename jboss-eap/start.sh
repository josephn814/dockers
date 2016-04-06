#!/usr/bin/env bash

if [ ! -v $JAVA_HOME ]; then
    JAVA_HOME=/opt/jdk1.7.0_80
fi
export JAVA_HOME
JBOSS_HOME=/opt/jboss-eap-6.1 ; export JBOSS_HOME
PATH=$JAVA_HOME/bin:$JBOSS_HOME/bin:$PATH ; export PATH

rm -rf $JBOSS_HOME/standalone/data/*
rm -rf $JBOSS_HOME/standalone/tmp/*

case "$1" in
    '')
        $JBOSS_HOME/bin/standalone.sh -h
		;;
	*)
		echo "Container is starting......."
		$JBOSS_HOME/bin/standalone.sh $@
		;;
esac
