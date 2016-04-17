FROM josedeng/jdk:jdk-1.7.0_80

ADD wget.sh /tmp/wget.sh
ADD installer.properties /installer/installer.properties
ADD start.sh /start.sh

RUN sed -i 's/\r$//' /tmp/wget.sh && \
    sed -i 's/\r$//' /start.sh && \
    sed -i 's/\r$//' /tmp/installer.properties && \
    apt-get -q update && \
    apt-get -q -y install wget unzip && \
    cd /tmp && \
    /bin/bash -c "source wget.sh" && \
    unzip V46005-01.zip && \
    chmod a+x /start.sh && \
    mv OCPlatform11.1.bin /installer/OCPlatform11.1.bin && \
    chmod 755 -R /installer && \
    chown -R developer:developer $JAVA_HOME && \
    chown -R developer:developer /opt/ATG && \
    apt-get clean && \
    apt-get autoremove wget unzip --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["$JAVA_HOME"]
VOLUME ["/opt/ATG"]

ENTRYPOINT ["/start.sh"]

