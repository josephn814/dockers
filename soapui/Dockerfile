FROM josedeng/jdk:jdk-1.8.0_92

ENV IDEA_JDK=$JAVA_HOME

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install -y libxi6 libxrender1 libxtst6 libxext6 libfreetype6 wget && \
    wget -q http://cdn01.downloads.smartbear.com/soapui/5.2.1/SoapUI-5.2.1-linux-bin.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/soapui && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/soapui && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/start.sh"]
