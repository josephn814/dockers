FROM josedeng/ubuntu:ubuntu-16.04

ENV DEBIAN_FRONTEND noninteractive

COPY . /

RUN dos2unix /chown.sh && \
    chmod a+x /chown.sh && \
    apt-get -q update && \
    apt-get -q -y install wget git iputils-ping net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer

VOLUME ["/home/developer"]
ENTRYPOINT ["/chown.sh"]
