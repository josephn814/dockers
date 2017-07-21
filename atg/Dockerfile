FROM josedeng/jdk:jdk-1.7.0_80

ADD wget.sh /tmp/wget.sh
ADD installer.properties /installer/installer.properties
ADD start.sh /start.sh

RUN dos2unix /tmp/wget.sh && \
    dos2unix /start.sh && \
    dos2unix /installer/installer.properties && \
    chmod a+x /tmp/wget.sh && \
    apt-get -q update && \
    apt-get -q -y install libxi6 libxrender1 libxtst6 libxext6 libfreetype6 wget unzip && \
    cd /tmp/ && \
    source /tmp/wget.sh && \
    mv /tmp/V861209-01.zip /installer/Platform.zip && \
    mv /tmp/V861194-01.zip /installer/ACC.zip && \
    chmod a+x /start.sh && \
    chmod 755 -R /installer && \
    mkdir -p /opt/ATG && \
    chown -R developer:developer $JAVA_HOME && \
    chown -R developer:developer /opt/ATG && \
    chown -R developer:developer /installer && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["$JAVA_HOME"]
VOLUME ["/opt/ATG"]

ENTRYPOINT ["/start.sh"]

