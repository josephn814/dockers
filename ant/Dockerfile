FROM josedeng/jdk:jdk-1.8.0_74

ENV DEBIAN_FRONTEND noninteractive

ENV ANT_VERSION apache-ant-1.9.6

# Install Tools
RUN apt-get -q update && \
    apt-get -q -y install wget && \
    apt-get clean && \
    wget -q -O /tmp/installer.tar.gz \
         --no-check-certificate \
         --no-cookies \
         https://www.apache.org/dist/ant/binaries/${ANT_VERSION}-bin.tar.gz && \
    mkdir -p /opt/ant && \
    tar -xzf /tmp/installer.tar.gz --strip-components=1 -C /opt/ant/${ANT_VERSION} && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R root:root /opt/ant

# set the environment variables 
ENV ANT_HOME /opt/ant/${ANT_VERSION}
ENV PATH=$PATH:$ANT_HOME/bin

ENTRYPOINT ["/bin/bash"]
