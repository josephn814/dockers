FROM josedeng/ubuntu:ubuntu-16.04

ENV DEBIAN_FRONTEND noninteractive

COPY . /

RUN dos2unix /chown.sh && \
    chmod a+x /chown.sh

USER developer

VOLUME ["/home/developer"]
ENTRYPOINT ["/chown.sh"]
