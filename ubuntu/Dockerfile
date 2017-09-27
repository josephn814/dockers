FROM ubuntu:17.04

ENV DEBIAN_FRONTEND noninteractive

RUN rm -f /bin/sh.distrib && \
    ln -s bash /bin/sh.distrib && \
    rm -f /bin/sh && \
    ln -s bash /bin/sh && \
    apt-get -q update && \
    apt-get -q -y install dos2unix sudo && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    apt-get clean && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/bin/bash"]
