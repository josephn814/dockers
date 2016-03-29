FROM ubuntu:15.10

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_77

# Install Oracle JDK
RUN apt-get -q update && \
    apt-get -q -y install wget && \
    apt-get clean && \
    wget -q -O /tmp/jdk.tar.gz \
         --no-check-certificate \
         --no-cookies \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz && \
    mkdir -p $JAVA_HOME && \
    tar -xzf /tmp/jdk.tar.gz --strip-components=1 -C $JAVA_HOME && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/*

# set the environment variables
ENV JDK_HOME=$JAVA_HOME PATH=$PATH:$JAVA_HOME/bin LANG=C.UTF-8

ENTRYPOINT ["/bin/bash"]
