FROM josedeng/ubuntu:ubuntu-16.04

ADD start.sh /start.sh

RUN dos2unix /start.sh && \
    chmod a+x /start.sh && \
    apt-get -q update && \
    apt-get -y install wget apache2 libapache2-mod-jk libapache2-mod-fcgid imagemagick libjpeg9 && \
    wget -O /tmp/mod-pagespeed.deb "https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb" && \
    dpkg -i /tmp/mod-pagespeed.deb && \
    mkdir -p /usr/local/apache2 && \
    ln -s /usr/lib/apache2/modules /usr/local/apache2/modules && \
    ln -s /etc/apache2 /usr/local/apache2/conf && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

EXPOSE 80 443

VOLUME ["/usr/local/apache2"]
ENTRYPOINT ["/start.sh"]
