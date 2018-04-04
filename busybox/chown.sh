#!/usr/bin/env bash

DIRECTORY=/home/developer

if [ "`ls -A $DIRECTORY`" = "" ]; then
    touch $DIRECTORY/.bashrc
    sudo chown -R developer:developer $DIRECTORY
    echo "alias ll='ls -alF'" >> $DIRECTORY/.bashrc
    echo "alias la='ls -A'" >> $DIRECTORY/.bashrc
    echo "alias l='ls -CF'" >> $DIRECTORY/.bashrc
    echo "LD_LIBRARY_PATH=/opt/sqlplus:\$LD_LIBRARY_PATH ; export LD_LIBRARY_PATH" >> $DIRECTORY/.bashrc
    echo "NLS_LANG=AMERICAN_AMERICA.UTF8 ; export NLS_LANG" >> $DIRECTORY/.bashrc
    echo "PATH=/opt/sqlplus:\$PATH ; export PATH" >> $DIRECTORY/.bashrc
    source $DIRECTORY/.bashrc
fi

if [ ! -e $DIRECTORY/init.sh ]; then
    touch $DIRECTORY/init.sh
    sudo chown -R developer:developer $DIRECTORY
    sudo chmod a+x $DIRECTORY/init.sh
    echo "#!/usr/bin/env bash" >> $DIRECTORY/init.sh
fi

source $DIRECTORY/init.sh

$1
