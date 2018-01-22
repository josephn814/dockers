FROM josedeng/jdk:jdk-1.8.0_92

ADD start.sh /start.sh

ENV GRADLE_VERSION gradle-4.4.1

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget unzip libaio1 && \
    wget -q -O /tmp/installer.tar.gz \
         --no-check-certificate \
         --no-cookies \
         https://services.gradle.org/distributions/${GRADLE_VERSION}-all.zip && \
    unzip /tmp/installer.tar.gz -d /opt && \
    chown -R developer:developer /opt/$GRADLE_VERSION && \
    apt-get autoremove wget unzip --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/opt/$GRADLE_VERSION"]

ENTRYPOINT ["/start.sh"]
