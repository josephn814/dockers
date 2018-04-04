FROM josedeng/ubuntu:ubuntu-16.04

ADD start.sh /start.sh

ENV NODEJS_VERSION v4.9.1
ENV NODEJS_PATH latest-v4.x

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget xz-utils && \
    wget -q -O /installer.tar.xz \
         --no-check-certificate \
         --no-cookies \
         https://nodejs.org/dist/$NODEJS_PATH/node-${NODEJS_VERSION}-linux-x64.tar.xz && \
    mkdir -p /opt/nodejs && \
    chown -R developer:developer /opt/nodejs && \
    rm -rf ~/.npm/ && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/opt/nodejs"]

ENTRYPOINT ["/start.sh"]
