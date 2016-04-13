FROM josedeng/jdk:jdk-1.8.0_77

ADD start.sh /start.sh

ENV GRADLE_VERSION gradle-2.12

RUN sed -i 's/\r$//' /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget unzip libaio1 && \
    wget -q -O /tmp/installer.tar.gz \
         --no-check-certificate \
         --no-cookies \
         https://services.gradle.org/distributions/$GRADLE_VERSION-bin.zip && \
    unzip /tmp/installer.tar.gz -d /opt && \
    apt-get clean && \
    apt-get autoremove wget unzip --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/opt/$GRADLE_VERSION"]

ENTRYPOINT ["/start.sh"]