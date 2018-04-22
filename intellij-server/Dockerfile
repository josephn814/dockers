FROM josedeng/jdk:jdk-1.8.0_162

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /daemon && \
    chmod a+x /daemon.jar && \
    chmod a+x /start.sh

USER developer
VOLUME ["/home/developer"]

EXPOSE 8888 8080

ENTRYPOINT ["/start.sh"]
