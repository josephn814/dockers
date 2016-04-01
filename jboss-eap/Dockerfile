FROM josedeng/jdk:jdk-1.7.0_80

ADD start.sh /start.sh

RUN chmod a+x /start.sh && \
    apt-get update && \
    apt-get install wget unzip -y && \
    cd /tmp && \
    wget --user-agent="Mozilla/5.0" \
        --no-check-certificate \
        --keep-session-cookies \
        --save-cookies=cookie \
        --load-cookies=cookie \
        "https://access.cdn.redhat.com/content/origin/files/sha256/16/16ea1e0cef29e94c0d795bbc4b4c431dcb14c4d10831dce5ff48194ff4fb2aee/jboss-eap-6.1.0.zip?_auth_=1459531364_a65d68bea91a3ed1fa9f19a16485ea8a" \
        -O jboss-eap.zip
#    apt-get clean && \
#    apt-get autoremove wget unzip --purge -y && \
#    rm -rf /var/lib/apt/lists/* && \
#    rm -rf /tmp/*

ENTRYPOINT ["/start.sh"]