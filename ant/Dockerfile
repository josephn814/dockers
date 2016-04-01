FROM josedeng/jdk:jdk-1.8.0_77

ADD start.sh /start.sh

ENV ANT_VERSION apache-ant-1.9.6

RUN chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget && \
    apt-get clean && \
    wget -q -O /tmp/installer.tar.gz \
         --no-check-certificate \
         --no-cookies \
         https://www.apache.org/dist/ant/binaries/${ANT_VERSION}-bin.tar.gz && \
    mkdir -p /opt/ant/${ANT_VERSION} && \
    tar -xzf /tmp/installer.tar.gz --strip-components=1 -C /opt/ant/${ANT_VERSION} && \
    chown -R developer:developer /opt/ant/$ANT_VERSION && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer

ENTRYPOINT ["/start.sh"]
