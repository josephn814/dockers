FROM josedeng/jdk:jdk-1.8.0_74

ADD cookies /tmp/cookies

RUN cd /tmp && \
    wget --user-agent="Mozilla/5.0" --no-check-certificate --load-cookies=/tmp/cookies --save-cookies=/tmp/cookies --keep-session-cookies "http://download.oracle.com/otn/java/sqldeveloper/sqldeveloper-4.1.3.20.78-no-jre.zip"

ENTRYPOINT ["/bin/bash"] 
