#!/usr/bin/env bash

JAVA_HOME=/opt/jdk1.8.0_162 ; export JAVA_HOME
JAVA_VM=$JAVA_HOME/bin/java ; export JAVA_VM
CLASSPATH=.:$JAVA_HOME/lib ; export CLASSPATH
JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 ; export JAVA_TOOL_OPTIONS

PATH=$JAVA_HOME/bin:$PATH; export PATH

nohup /daemon -p 8888 -u josedeng > /tmp/daemon.log 2>&1 &
nohup java -jar /daemon.jar > /tmp/daemon1.log 2>&1 &

shutdown(){
   END=1
}

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
