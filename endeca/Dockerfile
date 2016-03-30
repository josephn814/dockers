FROM josedeng/jdk:jdk-1.7.0_80

ENV DEBIAN_FRONTEND noninteractive 

# Install Tools
RUN apt-get update && \
    apt-get install -y unzip libaio1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD wget.sh /tmp/wget.sh
ADD install.sh /tmp/install.sh
ADD tools.rsp /tmp/tools.rsp

RUN cd /tmp && \
    chmod +x /tmp/install.sh && \
    /bin/bash -c "source /tmp/wget.sh" && \
    /bin/bash -c "source /tmp/install.sh"

ENTRYPOINT ["/bin/bash"]
