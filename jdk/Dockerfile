FROM ubuntu:15.10

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME /opt/jdk1.7.0_80

# Install Oracle JDK
RUN apt-get -q update && \
    apt-get -q -y install wget && \
    wget -q -O /tmp/jdk.tar.gz \
         --no-check-certificate \
         --no-cookies \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz && \
    mkdir -p $JAVA_HOME && \
    tar -xzf /tmp/jdk.tar.gz --strip-components=1 -C $JAVA_HOME && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    chown -R developer:developer $JAVA_HOME && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/*
    rm -rf /tmp/* && \

# set the environment variables
ENV JDK_HOME=$JAVA_HOME PATH=$PATH:$JAVA_HOME/bin LANG=C.UTF-8

ENTRYPOINT ["/bin/bash"]
