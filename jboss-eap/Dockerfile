FROM josedeng/ubuntu:ubuntu-16.04

ADD start.sh /start.sh

ENV JBOSS_HOME /opt/jboss-eap-7.0

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install wget unzip openjdk-8-jdk -y && \
    mkdir -p /installer && \
    cd /tmp && \
    wget --user-agent="Mozilla/5.0" \
        --no-check-certificate \
        --no-cookies \
        "https://access.cdn.redhat.com/content/origin/files/sha256/7c/7c28c74e475a296b6e3370b5eb2e21f158c31f4b50d56dafadada6483b23340e/jboss-eap-7.0.0.zip?_auth_=1540880542_f2152ef62eb30c850f0c5abdf4d6f13a#fndtn-rhel" \
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
