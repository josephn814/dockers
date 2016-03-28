FROM josedeng/jdk:jdk-1.8.0_74

ADD cookies /tmp/cookies

RUN apt-get update && \
    apt-get install -y libxi6 libxrender1 libxtst6 libxext6 libfreetype6 unzip && \
    cd /tmp && \
    wget --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=/tmp/cookies --save-cookies=/tmp/cookies --keep-session-cookies "http://download.oracle.com/otn/java/sqldeveloper/sqldeveloper-4.1.3.20.78-no-jre.zip" && \
    unzip -q sqldeveloper-4.1.3.20.78-no-jre.zip -d /opt/ && \
    chmod a+x /opt/sqldeveloper/sqldeveloper.sh && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/opt/sqldeveloper/sqldeveloper.sh"] 
