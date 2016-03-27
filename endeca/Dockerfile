FROM josedeng/jdk:jdk-1.7.0_80

ENV DEBIAN_FRONTEND noninteractive 

# Install Tools
RUN apt-get update && \
    apt-get install -y unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD wget.sh /tmp/wget.sh

RUN cd /tmp && \
    /bin/bash -c "source /tmp/wget.sh"

ENTRYPOINT ["/bin/bash"]
