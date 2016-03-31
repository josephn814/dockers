FROM josedeng/jdk:jdk-1.8.0_77

ENV IDEA_JDK=$JAVA_HOME

ADD daemon /opt/ide/daemon
ADD start.sh /opt/ide/start.sh 

RUN apt-get update && \
    apt-get install -y libxi6 libxrender1 libxtst6 libxext6 libfreetype6 git subversion mercurial wget && \
    wget -q https://download.jetbrains.com/idea/ideaIU-2016.1.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    chmod a+x /opt/ide/daemon && \
    chmod a+x /opt/ide/start.sh && \
    apt-get autoremove wget --purge -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \    
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/opt/ide/start.sh"]
