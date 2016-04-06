#!/usr/bin/env bash

GRADLE_HOME=/opt/gradle-2.12 ; export GRADLE_HOME
if [ ! -v $JAVA_HOME ]; then
    JAVA_HOME=/opt/jdk1.8.0_77
fi
export JAVA_HOME
PATH=$JAVA_HOME/bin:$GRADLE_HOME/bin:$PATH ; export PATH

shutdown(){
	END=1
}

case "$1" in
    '')
		trap 'shutdown' INT TERM

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