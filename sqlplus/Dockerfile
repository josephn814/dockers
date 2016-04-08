FROM ubuntu:15.10

ADD start.sh /start.sh
ADD cookies /tmp/cookies

RUN sed -i 's/\r$//' /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget libaio1 unzip && \
    wget --user-agent="Mozilla/5.0" \
         --no-check-certificate \
         --load-cookies=/tmp/cookies \
         --save-cookies=/tmp/cookies \
         --keep-session-cookies \
         -O /tmp/installer.zip \
         http://download.oracle.com/otn/linux/instantclient/121020/instantclient-basic-linux.x64-12.1.0.2.0.zip && \
    wget --user-agent="Mozilla/5.0" \
         --no-check-certificate \
         --load-cookies=/tmp/cookies \
         --save-cookies=/tmp/cookies \
         --keep-session-cookies \
         -O /tmp/installer1.zip \
         http://download.oracle.com/otn/linux/instantclient/121020/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip && \
    mkdir -p /opt/sqlplus && \
    cd /tmp && \
    unzip /tmp/installer.zip && \
    unzip /tmp/installer1.zip && \
    mv /tmp/instantclient_12_1/* /opt/sqlplus && \
    cd /opt/sqlplus && \
    ln -s libclntshcore.so.12.1 libclntshcore.so && \
    ln -s libclntsh.so.12.1 libclntsh.so && \
    ln -s libocci.so.12.1 libocci.so && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    chown -R developer:developer /opt/sqlplus && \
    apt-get clean && \
    apt-get autoremove wget unzip --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/opt/sqlplus"]

ENTRYPOINT ["/start.sh"]