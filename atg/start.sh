#!/usr/bin/env bash

DIRECTORY=/opt/ATG
if [ "`ls -A $DIRECTORY`" = "" ]; then
  echo "ATG has been installed."
else
  echo "Installing ATG."
  /installer/OCPlatform11.1.bin -i silent -f /installer/installer.properties
fi

shutdown(){
	END=1
}

case "$1" in
    '')
		trap 'shutdown' INT TERM

		while [ "$END" == '' ]; do
			sleep 1
		done
		;;
	*)
		echo "Container is starting......."
		$@
		;;
esac
