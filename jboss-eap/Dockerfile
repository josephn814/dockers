FROM josedeng/jdk:jdk-1.8.0_162

ADD start.sh /start.sh

ENV JBOSS_HOME /opt/jboss-eap-6.4

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install wget unzip -y && \
    mkdir -p /installer && \
    cd /tmp && \
    wget --user-agent="Mozilla/5.0" \
        --no-check-certificate \
        --no-cookies \
        "https://access.cdn.redhat.com/content/origin/files/sha256/27/27a6fd62a8bc4f660970ab282a4bc013934275e47a850a974db6c7d2c62cc50e/jboss-eap-6.4.0.zip?_auth_=1523092178_87db09cbd4dcf686ca47268dbec51631" \
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
