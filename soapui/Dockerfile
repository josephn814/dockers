FROM josedeng/jdk:jdk-1.8.0_92

ENV IDEA_JDK=$JAVA_HOME

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install -y libxi6 libxrender1 libxtst6 libxext6 libfreetype6 wget && \
    wget -q https://b537910400b7ceac4df0-22e92613740a7dd1247910134033c0d1.ssl.cf5.rackcdn.com/soapui/5.3.0/SoapUI-5.3.0-linux-bin.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/soapui && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/soapui && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/start.sh"]
