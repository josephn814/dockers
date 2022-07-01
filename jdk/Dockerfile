ARG UBUNTU_VERSION=22.04

FROM ubuntu:${UBUNTU_VERSION} as builder-stage

ARG JDK_VERSION=8u333
ARG JDK_BUILD=1.8.0_333-b02
ARG JDK_HASH=2dee051a5d0647d5be72a7c0abff270e
ARG JAVA_HOME=/opt/java
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# Setup environment variables
ENV JDK_VERSION=${JDK_VERSION} JAVA_HOME=${JAVA_HOME}

# Install dependencies from yum repository
RUN apt update && \
    apt install -y wget

# Install packages
RUN mkdir -p /tmp/installers && \
    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" --tries=3 https://javadl.oracle.com/webapps/download/GetFile/${JDK_BUILD}/${JDK_HASH}/linux-i586/jdk-${JDK_VERSION}-linux-x64.tar.gz -O /tmp/installers/jdk.tar.gz \
    mkdir -p ${JAVA_HOME} && tar xvzf /tmp/installers/jdk.tar.gz --strip-components=1 -C ${JAVA_HOME} \
    chown -R ${USER_UID}:${USER_GID} ${JAVA_HOME}

FROM ubuntu:${UBUNTU_VERSION}

# Build arguments
ARG JAVA_HOME=/opt/java
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# Setup environment variables
ENV JAVA_HOME=${JAVA_HOME}
# Setup runtime environment variables
ENV PATH="${JAVA_HOME}/bin:${PATH}"

COPY --from=builder-stage ${JAVA_HOME} ${JAVA_HOME}

USER ${USERNAME}
