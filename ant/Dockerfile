FROM josedeng/jdk:jdk-1.8.0_92

ADD start.sh /start.sh

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget libaio1 && \
    wget -q -O /tmp/installer.tar.gz \
         --no-check-certificate \
         --no-cookies \
         https://www.apache.org/dist/ant/binaries/apache-ant-1.10.3-bin.tar.gz && \
    mkdir -p /opt/ant && \
    tar -xzf /tmp/installer.tar.gz --strip-components=1 -C /opt/ant && \
    chown -R developer:developer /opt/ant && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/opt/ant"]

ENTRYPOINT ["/start.sh"]
