FROM ubuntu:groovy-20210416

ENV DEBIAN_FRONTEND noninteractive

RUN rm -f /bin/sh.distrib && \
    ln -s bash /bin/sh.distrib && \
    rm -f /bin/sh && \
    ln -s bash /bin/sh && \
    apt -q update && \
    apt -q -y install dos2unix sudo && \
    groupadd --gid 1000 developer && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    apt clean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/bin/bash"]
