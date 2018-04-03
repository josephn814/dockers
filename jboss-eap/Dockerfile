FROM josedeng/jdk:jdk-1.7.0_80

ADD start.sh /start.sh

ENV JBOSS_HOME /opt/jboss-eap-6.1

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install wget unzip -y && \
    mkdir -p /installer && \
    cd /tmp && \
    wget --user-agent="Mozilla/5.0" \
        --no-check-certificate \
        --keep-session-cookies \
        --save-cookies=cookie \
        --load-cookies=cookie \
        "https://access.cdn.redhat.com/content/origin/files/sha256/16/16ea1e0cef29e94c0d795bbc4b4c431dcb14c4d10831dce5ff48194ff4fb2aee/jboss-eap-6.1.0.zip?_auth_=1522737065_c9f90e049fe9b3bedfb13977b64aa257" \
        -O /installer/jboss-eap.zip && \
    mkdir -p $JBOSS_HOME && \
    chown -R developer:developer /installer && \
    chown -R developer:developer $JBOSS_HOME && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["$JBOSS_HOME"]

ENTRYPOINT ["/start.sh"]
