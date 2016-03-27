FROM ubuntu:15.10

ENV DEBIAN_FRONTEND noninteractive

# Install Oracle JDK
RUN apt-get -q update && \
    apt-get -q -y install wget && \
    apt-get clean && \
    wget -q -O /tmp/jdk.tar.gz \
         --no-check-certificate \
         --no-cookies \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz && \
    mkdir -p /usr/lib/jvm && \
    tar -xzf /tmp/jdk.tar.gz -C /usr/lib/jvm && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R root:root /usr/lib/jvm

# set the environment variables 
ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_74
ENV JDK_HOME=$JAVA_HOME PATH=$PATH:$JAVA_HOME/bin LANG=C.UTF-8

ENTRYPOINT ["/bin/bash"]
