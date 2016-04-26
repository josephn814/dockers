FROM josedeng/jdk:jdk-1.8.0_92

ADD cookies /tmp/cookies

RUN dos2unix /tmp/cookies && \
    apt-get update && \
    apt-get install -y libxi6 libxrender1 libxtst6 libxext6 libfreetype6 wget unzip && \
    cd /tmp && \
    wget --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=/tmp/cookies --save-cookies=/tmp/cookies --keep-session-cookies "http://download.oracle.com/otn/java/sqldeveloper/sqldeveloper-4.1.3.20.78-no-jre.zip" && \
    unzip -q sqldeveloper-4.1.3.20.78-no-jre.zip -d /opt/ && \
    chmod a+x /opt/sqldeveloper/sqldeveloper.sh && \
    apt-get clean && \
    apt-get autoremove wget unzip --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/opt/sqldeveloper/sqldeveloper.sh"]
