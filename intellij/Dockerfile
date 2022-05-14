ARG UBUNTU_VERSION=22.04

FROM ubuntu:${UBUNTU_VERSION} as builder-stage

# Build arguments
ARG JDK_VERSION=8u321
ARG JDK_BUILD=1.8.0_321-b07
ARG JDK_HASH=df5ad55fdd604472a86a45a217032c7d
ARG JAVA_HOME=/opt/java
ARG IDE_HOME=/opt/ide
ARG IDE_VERSION=2022.1.1

# Setup environment variables
ENV JDK_VERSION=${JDK_VERSION} JAVA_HOME=${JAVA_HOME} IDE_VERSION=${IDE_VERSION} IDE_HOME=${IDE_HOME}
# Setup runtime environment variables
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install packages
RUN apt update && \
    apt install -y wget && \
    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" https://javadl.oracle.com/webapps/download/GetFile/${JDK_BUILD}/${JDK_HASH}/linux-i586/jdk-${JDK_VERSION}-linux-x64.tar.gz -O /tmp/jdk.tar.gz && \
    mkdir -p ${JAVA_HOME} && tar -zxvf /tmp/jdk.tar.gz --strip-components=1 -C ${JAVA_HOME}  && \
    wget --no-cookies --no-check-certificate  https://download.jetbrains.com/idea/ideaIU-${IDE_VERSION}.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p ${IDE_HOME} && tar -zxvf /tmp/ide.tar.gz --strip-components=1 -C ${IDE_HOME} 

FROM ubuntu:${UBUNTU_VERSION}

# Build arguments
ARG JAVA_HOME=/opt/java

# Setup environment variables
ENV JAVA_HOME=${JAVA_HOME}
# Setup runtime environment variables
ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN apt update && \
    apt install -y libxi6 libgtk2.0-0 libcanberra-gtk-module libxrender1 libxtst6 libxext6 libfreetype6 libxshmfence1 \
                   libnss3 libx11-xcb1 libxcb-dri3-0 libdrm-dev libgbm1 libxss1 libatk-bridge2.0-0 libdbusmenu-glib4 \
                   vim git subversion mercurial wget net-tools iputils-ping inetutils-telnet language-pack-en libxkbcommon-x11-0 \
                   libpulse0 libglu1 locales && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    apt clean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENV LANG en_US.utf8

COPY --from=builder-stage /opt /opt

RUN ln -s /opt/ide/bin/idea.sh /bin/idea.sh && \
    useradd -ms /bin/bash developer && chown -R developer:developer /opt

USER developer

ENTRYPOINT ["idea.sh"]
