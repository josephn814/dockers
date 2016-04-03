FROM ubuntu:15.10

ADD start.sh /start.sh

ENV NODEJS_VERSION v5.10.0

RUN sed -i 's/\r$//' /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget && \
    wget -q -O /tmp/installer.tar.xz \
         --no-check-certificate \
         --no-cookies \
         https://nodejs.org/dist/$NODEJS_VERSION/node-$NODEJS_VERSION-linux-x64.tar.xz && \
    mkdir -p /opt/node-$NODEJS_VERSION && \
    tar -xvJf /tmp/installer.tar.xz --strip-components=1 -C /opt/node-$NODEJS_VERSION && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    chown -R developer:developer /opt/node-$NODEJS_VERSION&& \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

#USER developer
VOLUME ["/opt/node-$NODEJS_VERSION"]

ENTRYPOINT ["/start.sh"]