#!/bin/bash

ln -s /usr/bin/awk /bin/awk
ln -s /usr/bin/basename /bin/basename
ln -s /bin/gzip /usr/bin/gzip

unzip -q V45999-01.zip
unzip -q V46002-01.zip
unzip -q V46387-01.zip
unzip -q V46393-01.zip
chmod +x OCcas11.1.0-Linux64.sh OCmdex6.5.1-Linux64_829811.sh OCplatformservices11.1.0-Linux64.bin

./OCmdex6.5.1-Linux64_829811.sh --silent --target /opt && source /opt/endeca/MDEX/6.5.1/mdex_setup_sh.ini

touch /tmp/platform_silent.txt
echo "8888" > /tmp/platform_silent.txt
echo "8090" >> /tmp/platform_silent.txt
echo "Y" >> /tmp/platform_silent.txt
echo "/opt/endeca/MDEX/6.5.1" >> /tmp/platform_silent.txt
echo "Y" >> /tmp/platform_silent.txt

touch /tmp/cas_silent.txt
echo "8500" > /tmp/cas_silent.txt
echo "8506" > /tmp/cas_silent.txt
echo "localhost" >> /tmp/cas_silent.txt

./OCplatformservices11.1.0-Linux64.bin --silent --target /opt < /tmp/platform_silent.txt && source /opt/endeca/PlatformServices/workspace/setup/installer_sh.ini

groupadd --gid 1000 endeca
useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash endeca

chown -R endeca:endeca /opt/endeca

su endeca -c  "cd /tmp/cd/Disk1/install && source silent_install.sh /tmp/tools.rsp ToolsAndFrameworks /opt/endeca/ToolsAndFrameworks admin" && /home/endeca/oraInventory/orainstRoot.sh

./OCcas11.1.0-Linux64.sh --silent --target /opt < /tmp/cas_silent.txt

rm -rf /tmp/*
