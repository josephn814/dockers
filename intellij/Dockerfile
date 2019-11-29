FROM josedeng/ubuntu:ubuntu-16.04

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt update && \
    apt upgrade -y && \
    apt install -y libxi6 libgtk2.0-0 libcanberra-gtk-module libxrender1 libxtst6 libxext6 libfreetype6 git subversion mercurial wget firefox && \
    wget -q https://download.jetbrains.com/idea/ideaIU-2019.3.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    apt clean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/start.sh"]
