FROM josedeng/jdk:jdk-1.8.0_74

ENV DEBIAN_FRONTEND noninteractive

ENV ANT_VERSION 1.9.6

# Install Tools
RUN apt-get -q update && \
    apt-get -q -y install wget && \
    apt-get clean && \
    wget -q -O /tmp/installer.tar.gz \
         --no-check-certificate \
         --no-cookies \
         https://www.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mkdir -p /opt/ant && \
    tar -xzf /tmp/installer.tar.gz -C /opt/ant/ && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R root:root /opt/ant

# set the environment variables 
ENV ANT_HOME /opt/ant/apache-ant-${ANT_VERSION}
ENV PATH=$PATH:$ANT_HOME/bin

ENTRYPOINT ["/bin/bash"]
