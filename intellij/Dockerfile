FROM josedeng/jdk:jdk-1.8.0_74

ENV IDEA_JDK=$JAVA_HOME

ADD daemon /opt/ide/daemon
ADD start.sh /opt/ide/start.sh 

RUN apt-get update && \
    apt-get install -y libxi6 libxrender1 libxtst6 libxext6 libfreetype6 git subversion mercurial && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    chmod a+x /opt/ide/daemon && \
    chmod a+x /opt/ide/start.sh && \
    wget -q https://download.jetbrains.com/idea/ideaIU-2016.1.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    rm /tmp/ide.tar.gz

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/opt/ide/start.sh"]
