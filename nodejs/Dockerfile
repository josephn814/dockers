FROM ubuntu:15.10

ADD start.sh /start.sh

ENV NODEJS_VERSION v5.10.0

RUN sed -i 's/\r$//' /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget && \
    wget -q -O /tmp/installer.tar.gz \
         --no-check-certificate \
         --no-cookies \
         https://nodejs.org/dist/$NODEJS_VERSION/node-$NODEJS_VERSION-linux-x64.tar.xz && \
    mkdir -p /opt/node-$NODEJS_VERSION && \
    tar -xzf /tmp/installer.tar.gz --strip-components=1 -C /opt/node-$NODEJS_VERSION && \
    chown -R developer:developer /opt/node-$NODEJS_VERSION&& \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/opt/node-$NODEJS_VERSION"]

ENTRYPOINT ["/start.sh"]