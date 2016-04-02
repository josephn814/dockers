FROM josedeng/jdk:jdk-1.7.0_80

ADD start.sh /start.sh

ENV JBOSS_HOME /opt/jboss-eap-6.1

RUN sed -i 's/\r$//' /start.sh && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install wget unzip -y && \
    cd /tmp && \
    wget --user-agent="Mozilla/5.0" \
        --no-check-certificate \
        --keep-session-cookies \
        --save-cookies=cookie \
        --load-cookies=cookie \
        "https://access.cdn.redhat.com/content/origin/files/sha256/16/16ea1e0cef29e94c0d795bbc4b4c431dcb14c4d10831dce5ff48194ff4fb2aee/jboss-eap-6.1.0.zip?_auth_=1459536365_d1bf6fe11ca6d2a07592a8899cfab8f3#\!project=eap" \
        -O jboss-eap.zip && \
    unzip jboss-eap.zip -d /opt && \
    chown -R developer:developer $JBOSS_HOME && \
    apt-get clean && \
    apt-get autoremove wget unzip --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["$JBOSS_HOME/standalone"]
EXPOSE 8080 8443

ENTRYPOINT ["/start.sh"]