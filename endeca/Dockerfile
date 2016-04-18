FROM josedeng/jdk:jdk-1.7.0_80

ADD wget.sh /tmp/wget.sh
ADD tools.rsp /tmp/tools.rsp
ADD start.sh /start.sh

RUN sed -i 's/\r$//' /tmp/wget.sh && \
    sed -i 's/\r$//' /tmp/tools.rsp && \
    sed -i 's/\r$//' /start.sh && \
    apt-get update && \
    apt-get install -y unzip libaio1 && \
    apt-get clean && \
    ln -s /usr/bin/awk /bin/awk && \
    ln -s /usr/bin/basename /bin/basename && \
    ln -s /bin/gzip /usr/bin/gzip && \
    cd /tmp && \
    /bin/bash -c "source wget.sh" && \
    mkdir -p /installer && \
    mv V45999-01.zip /installer/V45999-01.zip && \
    mv V46002-01.zip /installer/V46002-01.zip && \
    mv V46387-01.zip /installer/V46387-01.zip && \
    mv V46393-01.zip /installer/V46393-01.zip && \
    chmod a+x -R /installer && \
    apt-get clean && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/opt/endeca"]
EXPOSE 8006 8888
ENTRYPOINT ["/bin/bash"]
