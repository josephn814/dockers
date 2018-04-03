#!/usr/bin/env bash

DIRECTORY=/home/developer

if [ "`ls -A $DIRECTORY`" = "" ]; then
    sudo chown -R developer:developer $DIRECTORY
fi

if [ ! -e $DIRECTORY/init.sh ]; then
    touch $DIRECTORY/init.sh
    sudo chown -R developer:developer $DIRECTORY
    sudo chmod a+x $DIRECTORY/init.sh
    echo "#!/usr/bin/env bash" >> $DIRECTORY/init.sh
fi

source $DIRECTORY/init.sh

$1
