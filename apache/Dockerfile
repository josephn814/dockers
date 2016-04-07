FROM ubuntu:15.10

ADD start.sh /start.sh

RUN sed -i 's/\r$//' /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install wget && \
    wget -q -O /tmp/installer.tar.gz \
         --no-check-certificate \
         --no-cookies \
         http://www.apache.org/dist/httpd/httpd-2.4.18.tar.gz && \
    mkdir -p /opt/apache && \
    tar -xzf /tmp/installer.tar.gz --strip-components=0 -C /opt/apache/ && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    chown -R developer:developer /opt/apache && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/opt/ant/$ANT_VERSION"]

ENTRYPOINT ["/start.sh"]