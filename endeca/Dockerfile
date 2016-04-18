FROM josedeng/jdk:jdk-1.7.0_80

ADD wget.sh /tmp/wget.sh
ADD tools.rsp /installer/tools.rsp
ADD start.sh /start.sh

RUN sed -i 's/\r$//' /tmp/wget.sh && \
    sed -i 's/\r$//' /installer/tools.rsp && \
    sed -i 's/\r$//' /start.sh && \
    chmod a+x /start.sh && \
    apt-get update && \
    apt-get install -y wget unzip libaio1 && \
    apt-get clean && \
    cd /tmp && \
    /bin/bash -c "source wget.sh" && \
    mv V45999-01.zip /installer/V45999-01.zip && \
    mv V46002-01.zip /installer/V46002-01.zip && \
    mv V46387-01.zip /installer/V46387-01.zip && \
    mv V46393-01.zip /installer/V46393-01.zip && \
    chmod a+x -R /installer && \
    apt-get clean && \
    apt-get autoremove wget --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/opt/endeca"]
EXPOSE 8006 8888
ENTRYPOINT ["/start.sh"]
