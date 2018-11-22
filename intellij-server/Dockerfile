FROM josedeng/ubuntu:ubuntu-16.04

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /daemon && \
    chmod a+x /daemon.jar && \
    chmod a+x /start.sh && \
    apt -q update && \
    apt -q -y install openjdk-8-jdk && \
    apt clean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer

EXPOSE 8888 8080

ENTRYPOINT ["/start.sh"]
