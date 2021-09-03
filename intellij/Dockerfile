FROM josedeng/ubuntu:ubuntu-18.04

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt update && \
    apt upgrade -y && \
    apt install -y libxi6 libgtk2.0-0 libcanberra-gtk-module libxrender1 libxtst6 libxext6 libfreetype6 libxshmfence1 \
                   libnss3 libx11-xcb1 libxcb-dri3-0 libdrm-dev libgbm1 libxss1 libatk-bridge2.0-0 libdbusmenu-glib4 \
                   vim git subversion mercurial wget net-tools iputils-ping inetutils-telnet language-pack-en libxkbcommon-x11-0 && \
                   libpulse0 libglu1 && \
    wget -q https://download.jetbrains.com/idea/ideaIU-2021.2.1.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    apt clean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/start.sh"]
