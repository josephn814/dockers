FROM josedeng/ubuntu:ubuntu-16.04

ENV DEBIAN_FRONTEND noninteractive

COPY . /

RUN dos2unix /chown.sh && \
    chmod a+x /chown.sh && \
    apt-get -q update && \
    apt-get -q -y install wget git iputils-ping net-tools vim curl libaio1 unzip apache2 libapache2-mod-jk libapache2-mod-fcgid imagemagick libjpeg9 && \
    wget --load-cookies /cookies \
         -O /tmp/installer1.zip \
         "http://download.oracle.com/otn/linux/instantclient/122010/instantclient-basic-linux.x64-12.2.0.1.0.zip" && \
    wget --load-cookies /cookies \
         -O /tmp/installer2.zip \
         "http://download.oracle.com/otn/linux/instantclient/122010/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip" && \
    mkdir -p /opt/sqlplus && \
    cd /tmp && \
    unzip /tmp/installer1.zip && \
    unzip /tmp/installer2.zip && \
    mv /tmp/instantclient_12_2/* /opt/sqlplus && \
    cd /opt/sqlplus && \
    ln -s libclntshcore.so.12.1 libclntshcore.so && \
    ln -s libclntsh.so.12.1 libclntsh.so && \
    ln -s libocci.so.12.1 libocci.so && \
    chown -R developer:developer /opt/sqlplus && \
    wget -O /tmp/mod-pagespeed.deb "https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb" && \
    dpkg -i /tmp/mod-pagespeed.deb && \
    mkdir -p /usr/local/apache2 && \
    ln -s /usr/lib/apache2/modules /usr/local/apache2/modules && \
    ln -s /etc/apache2 /usr/local/apache2/conf && \
    sed -i 's/^Defaults.*env_reset/Defaults        !env_reset/g' /etc/sudoers  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer

VOLUME ["/home/developer", "/usr/local/apache2"]
ENTRYPOINT ["/chown.sh"]
