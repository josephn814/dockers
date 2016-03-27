FROM josedeng/jdk:jdk-1.7.0_80

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update && \
    apt-get -q -y install unzip && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD wget.sh /tmp/wget.sh
ADD installer.properties /tmp/installer.properties

RUN cd /tmp && \
    /bin/bash -c "source wget.sh" && \
    unzip V46005-01.zip && \
    chmod +x OCPlatform11.1.bin && \
    /bin/bash -c "./OCPlatform11.1.bin -i silent -f installer.properties" && \
    rm -rf /tmp/*

VOLUME ["$JAVA_HOME"]
VOLUME ["/opt/ATG"]

ENTRYPOINT ["/bin/bash"]

