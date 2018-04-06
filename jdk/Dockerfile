FROM josedeng/ubuntu:ubuntu-16.04

ADD . /
ENV JAVA_HOME=/opt/jdk1.7.0_80 JDK_HOME=/opt/jdk1.7.0_80 PATH=$PATH:/opt/jdk1.7.0_80/bin LANG=C.UTF-8

RUN apt-get -q update && \
    apt-get -q -y install wget && \
    wget -O /tmp/jdk.tar.gz \
         --load-cookies /cookies \
         http://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz && \
    mkdir -p $JAVA_HOME && \
    tar -xzf /tmp/jdk.tar.gz --strip-components=1 -C $JAVA_HOME && \
    chown -R developer:developer $JAVA_HOME && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/bin/bash"]
