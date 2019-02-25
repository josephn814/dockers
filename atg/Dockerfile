FROM josedeng/ubuntu:ubuntu-16.04

ADD wget.sh /tmp/wget.sh
ADD installer.properties /installer/installer.properties
ADD start.sh /start.sh

RUN dos2unix /tmp/wget.sh && \
    dos2unix /start.sh && \
    dos2unix /installer/installer.properties && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -q -y install libxi6 libxrender1 libxtst6 libxext6 libfreetype6 openjdk-8-jdk wget unzip && \
    source /tmp/wget.sh && \
    mv /tmp/V980682-01.zip /installer/Platform.zip && \
    mv /tmp/V980662-01.zip /installer/ACC.zip && \
    chmod a+x -R /installer && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/opt/ATG"]

ENTRYPOINT ["/start.sh"]

