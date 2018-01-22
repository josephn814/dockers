FROM josedeng/ubuntu:ubuntu-16.04

ENV JAVA_HOME /opt/jdk1.8.0_162
ENV JDK_HOME=$JAVA_HOME PATH=$PATH:$JAVA_HOME/bin LANG=C.UTF-8

RUN apt-get -q update && \
    apt-get -q -y install wget && \
    wget -q -O /tmp/jdk.tar.gz \
         --no-check-certificate \
         --no-cookies \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz && \
    mkdir -p $JAVA_HOME && \
    tar -xzf /tmp/jdk.tar.gz --strip-components=1 -C $JAVA_HOME && \
    chown -R developer:developer $JAVA_HOME && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/bin/bash"]
