FROM josedeng/jdk:jdk-1.7.0_80

ADD start /start.sh

RUN chmod a+x /start.sh && \
    apt-get update && \
    apt-get install wget unzip -y && \
    cd /tmp && \
    wget --user-agent="Mozilla/5.0" \
        --no-check-certificate \
        --keep-session-cookies \
        --save-cookies=cookie \
        --load-cookies=cookie \
        "https://access.cdn.redhat.com/content/origin/files/sha256/16/16ea1e0cef29e94c0d795bbc4b4c431dcb14c4d10831dce5ff48194ff4fb2aee/jboss-eap-6.1.0.zip?_auth_=1459529345_af5b4ae18a0a5c7122731dca9c6ca1f4#\!project=eap" \
        -O jboss-eap-6.1.0.zip && \
    apt-get clean && \
    apt-get autoremove wget unzip --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/start.sh"]