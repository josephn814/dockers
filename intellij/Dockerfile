FROM josedeng/ubuntu:ubuntu-18.04

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt update && \
    apt upgrade -y && \
    apt install -y libcanberra-gtk-module libcanberra-gtk0 chromium-browser git subversion mercurial wget net-tools iputils-ping && \
    wget -q https://download.jetbrains.com/idea/ideaIU-2020.2.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    apt clean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/start.sh"]
