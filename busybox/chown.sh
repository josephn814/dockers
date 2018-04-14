#!/usr/bin/env bash

if [ ! -d $ROOT_HOME ]; then
   sudo mkdir -p $ROOT_HOME
fi

if [ "`ls -A $ROOT_HOME`" = "" ]; then
    sudo ln -s /usr/lib/apache2/modules $ROOT_HOME/modules
    sudo cp -R /etc/apache2 $ROOT_HOME/conf
    sudo mkdir -p $ROOT_HOME/{logs,htdocs}
    sudo chown -R developer:developer $ROOT_HOME/conf $ROOT_HOME/logs $ROOT_HOME/htdocs
fi

DIRECTORY=/home/developer

if [ "`ls -A $DIRECTORY`" = "" ]; then
    touch $DIRECTORY/.bashrc
    sudo chown -R developer:developer $DIRECTORY
    echo "if [ -x /usr/bin/dircolors ]; then" >> $DIRECTORY/.bashrc
    echo "test -r ~/.dircolors && eval \"\$(dircolors -b ~/.dircolors)\" || eval \"\$(dircolors -b)\"" >> $DIRECTORY/.bashrc
    echo "alias ls='ls --color=auto'" >> $DIRECTORY/.bashrc
    echo "alias grep='grep --color=auto'" >> $DIRECTORY/.bashrc
    echo "alias fgrep='fgrep --color=auto'" >> $DIRECTORY/.bashrc
    echo "alias egrep='egrep --color=auto'" >> $DIRECTORY/.bashrc
    echo "fi" >> $DIRECTORY/.bashrc
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
