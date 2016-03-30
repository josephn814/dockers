FROM josedeng/jdk:jdk-1.7.0_80

ENV DEBIAN_FRONTEND noninteractive 

# Install Tools
RUN apt-get update && \
    apt-get install -y unzip libaio1 && \
    apt-get clean && \
    ln -s /usr/bin/awk /bin/awk && \
    ln -s /usr/bin/basename /bin/basename && \
    ln -s /bin/gzip /usr/bin/gzip && \
    groupadd --gid 1000 endeca && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash endeca && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD wget.sh /tmp/wget.sh
ADD tools.rsp /tmp/tools.rsp

RUN cd /tmp && \
    /bin/bash -c "source /tmp/wget.sh" && \
    unzip V45999-01.zip && \
    rm -f V45999-01.zip && \
    unzip V46002-01.zip && \
    rm -f V46002-01.zip && \
    rm -f OCpresAPI6.5.1-Linux64_829811.tgz && \
    unzip V46387-01.zip && \
    rm -f V46387-01.zip && \
    unzip V46393-01.zip && \
    rm -f V46393-01.zip && \
    chmod +x /tmp/OCcas11.1.0-Linux64.sh && \
    chmod +x /tmp/OCmdex6.5.1-Linux64_829811.sh && \
    chmod +x /tmp/OCplatformservices11.1.0-Linux64.bin
#    /bin/bash -c "source /tmp/OCmdex6.5.1-Linux64_829811.sh --silent --target /opt" && \
#    /bin/bash -c "source /opt/endeca/MDEX/6.5.1/mdex_setup_sh.ini" && \
#    touch /tmp/platform_silent.txt && \
#    echo "8888" > /tmp/platform_silent.txt && \
#    echo "8090" >> /tmp/platform_silent.txt && \
#    echo "Y" >> /tmp/platform_silent.txt && \
#    echo "/opt/endeca/MDEX/6.5.1" >> /tmp/platform_silent.txt && \
#    echo "Y" >> /tmp/platform_silent.txt && \
#    touch /tmp/cas_silent.txt && \
#    echo "8500" > /tmp/cas_silent.txt && \
#    echo "8506" > /tmp/cas_silent.txt && \
#    echo "localhost" >> /tmp/cas_silent.txt && \
#    /bin/bash -c "source /tmp/OCplatformservices11.1.0-Linux64.bin --silent --target /opt < /tmp/platform_silent.txt" && \
#    /bin/bash -c "source /opt/endeca/PlatformServices/workspace/setup/installer_sh.ini" && \
#    chown -R endeca:endeca /opt/endeca && \
#    su endeca -c  "cd /tmp/cd/Disk1/install && source silent_install.sh /tmp/tools.rsp ToolsAndFrameworks /opt/endeca/ToolsAndFrameworks admin" && \
#    /bin/bash -c "source /home/endeca/oraInventory/orainstRoot.sh" && \
#    /bin/bash -c "source /tmp/OCcas11.1.0-Linux64.sh --silent --target /opt < /tmp/cas_silent.txt" && \
#    rm -rf /tmp/*

ENTRYPOINT ["/bin/bash"]
