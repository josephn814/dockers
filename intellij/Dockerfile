FROM josedeng/jdk:jdk-1.8.0_144

ENV IDEA_JDK=$JAVA_HOME

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /daemon && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install -y libxi6 libxrender1 libxtst6 libxext6 libfreetype6 git subversion mercurial wget libsecret-1-0 gnome-keyring && \
    wget -q https://download.jetbrains.com/idea/ideaIU-2017.3.3.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    apt-get dist-upgrade -y && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/start.sh"]
