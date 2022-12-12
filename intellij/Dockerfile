ARG UBUNTU_VERSION=22.04
ARG JVM_HEAP=2048

FROM ubuntu:${UBUNTU_VERSION} as builder-stage

# Build arguments
ARG IDE_HOME=/opt/ide
ARG IDE_VERSION=2022.3
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# Setup environment variables
ENV IDE_VERSION=${IDE_VERSION} IDE_HOME=${IDE_HOME}

COPY packages /tmp/

# Install packages
RUN apt update -qq && \
    apt install -qq -y wget && \
    wget --no-cookies --no-check-certificate https://download.jetbrains.com/idea/ideaIU-${IDE_VERSION}.tar.gz -O /tmp/ide.tar.gz && \
    mkdir -p ${IDE_HOME} && tar -zxvf /tmp/ide.tar.gz --strip-components=1 -C ${IDE_HOME} && \
    tar -xvzf /tmp/plugins.tar.gz -C ${IDE_HOME} && \
    chown -R ${USER_UID}:${USER_GID} ${IDE_HOME} && \
    chmod +x ${IDE_HOME}/bin/idea.sh && \
    sed -i "s/-Xms\(.*\)m/-Xms${JVM_HEAP}m/g" ${IDE_HOME}/bin/idea64.vmoptions && \
    sed -i "s/-Xmx\(.*\)m/-Xmx${JVM_HEAP}m/g" ${IDE_HOME}/bin/idea64.vmoptions && \
    echo "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED" >> ${IDE_HOME}/bin/idea64.vmoptions && \
    echo "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED" >> ${IDE_HOME}/bin/idea64.vmoptions && \
    echo "-javaagent:${IDE_HOME}/netfilter/ja-netfilter.jar=jetbrains" >> ${IDE_HOME}/bin/idea64.vmoptions

FROM ubuntu:${UBUNTU_VERSION}

# Build arguments
ARG IDE_HOME=/opt/ide
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN apt update -qq && \
    apt install -qq -y libxi6 libgtk2.0-0 libcanberra-gtk-module libxrender1 libxtst6 libxext6 libfreetype6 libxshmfence1 \
                   libnss3 libx11-xcb1 libxcb-dri3-0 libdrm-dev libgbm1 libxss1 libatk-bridge2.0-0 libdbusmenu-glib4 \
                   vim git git-lfs subversion mercurial wget net-tools iputils-ping inetutils-telnet language-pack-en libxkbcommon-x11-0 \
                   libpulse0 libglu1 locales sudo curl apt-transport-https ca-certificates gnupg python3 && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg > /usr/share/keyrings/cloud.google.gpg && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
    apt update && \
    apt install -qq -y google-cloud-cli && \
    yes | gcloud components install kubectl && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    groupadd --gid ${USER_GID} ${USERNAME} && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} -s /bin/bash && \
    echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} && \
    chmod 0440 /etc/sudoers.d/${USERNAME} && \
    apt clean && \
    apt autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENV LANG=en_US.utf8 IDE_HOME=${IDE_HOME}

COPY --from=builder-stage ${IDE_HOME} ${IDE_HOME}

RUN ln -s ${IDE_HOME}/bin/idea.sh /bin/idea.sh

USER ${USERNAME}

ENTRYPOINT ["idea.sh"]
