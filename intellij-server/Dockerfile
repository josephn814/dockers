FROM josedeng/ubuntu:ubuntu-16.04

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /daemon && \
    chmod a+x /start.sh

USER developer
VOLUME ["/home/developer"]

EXPOSE 8888

ENTRYPOINT ["/start.sh"]
