FROM josedeng/ubuntu:ubuntu-16.04

ENV DEBIAN_FRONTEND noninteractive

COPY . /

RUN dos2unix /chown.sh && \
    chmod a+x /chown.sh && \
    apt-get -q update && \
    apt-get -q -y install wget git iputils-ping net-tools elvis-tiny curl libaio1 unzip && \
    wget --load-cookies /cookies \
         -O /tmp/installer.zip \
         "http://download.oracle.com/otn/linux/instantclient/121020/instantclient-basic-linux.x64-12.1.0.2.0.zip" && \
    wget --load-cookies /cookies \
         -O /tmp/installer2.zip \
         "http://download.oracle.com/otn/linux/instantclient/122010/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip" && \
    mkdir -p /opt/sqlplus && \
    cd /tmp && \
    unzip /tmp/installer.zip && \
    unzip /tmp/installer1.zip && \
    mv /tmp/instantclient_12_2/* /opt/sqlplus && \
    cd /opt/sqlplus && \
    ln -s libclntshcore.so.12.1 libclntshcore.so && \
    ln -s libclntsh.so.12.1 libclntsh.so && \
    ln -s libocci.so.12.1 libocci.so && \
    chown -R developer:developer /opt/sqlplus && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer

VOLUME ["/home/developer"]
ENTRYPOINT ["/chown.sh"]
