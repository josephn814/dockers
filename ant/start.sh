#!/usr/bin/env bash

ANT_VERSION=apache-ant-1.9.6 ; export ANT_VERSION
if [ "x$JAVA_HOME" = "x" ]; then
    JAVA_HOME=/opt/jdk1.8.0_92
fi
export JAVA_HOME
ANT_HOME=opt/ant/$ANT_VERSION ; export ANT_HOME
PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$PATH ; export PATH

shutdown(){
	END=1
}

case "$1" in
    '')
        trap 'shutdown' INT TERM
        echo "Container Started."
        $ANT_HOME/bin/ant -h
        while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac