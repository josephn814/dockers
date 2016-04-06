#!/usr/bin/env bash

ANT_VERSION=apache-ant-1.9.6 ; export ANT_VERSION

if [ ! -v $JAVA_HOME ]; then
    JAVA_HOME=/opt/jdk1.8.0_77
fi
export JAVA_HOME
ANT_HOME=opt/ant/$ANT_VERSION ; export ANT_HOME
PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH ; export PATH

case "$1" in
    '')
        $ANT_HOME/bin/ant -h
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac