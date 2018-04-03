#!/usr/bin/env bash

GRADLE_HOME=/opt/gradle-4.6 ; export GRADLE_HOME
if [ "x$JAVA_HOME" = "x" ]; then
    JAVA_HOME=/opt/jdk1.8.0_162
fi
export JAVA_HOME
PATH=$JAVA_HOME/bin:$GRADLE_HOME/bin:$PATH ; export PATH

shutdown(){
	END=1
}

case "$1" in
    '')
		trap 'shutdown' INT TERM
        echo "Container Started."
        $GRADLE_HOME/bin/gradle --version

		while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac
