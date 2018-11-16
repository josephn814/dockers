FROM josedeng/ubuntu:ubuntu-16.04

COPY . /

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install -y libxi6 libgtk2.0-0 libcanberra-gtk-module libxrender1 libxtst6 libxext6 libfreetype6 wget openjdk-8-jdk && \
    wget -q https://download-keycdn.ej-technologies.com/jprofiler/jprofiler_linux_10_1_4.tar.gz -O /tmp/jprofiler.tar.gz && \
    mkdir -p /opt/jprofiler && \
    tar zxvf /tmp/jprofiler.tar.gz --strip-components=1 -C /opt/jprofiler && \
    apt-get dist-upgrade -y && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER developer
VOLUME ["/home/developer"]

ENTRYPOINT ["/start.sh"]
