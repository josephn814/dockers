ARG UBUNTU_VERSION=22.04

FROM ubuntu:${UBUNTU_VERSION}

ARG USERNAME=jose
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y apt-transport-https ca-certificates curl gnupg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg > /usr/share/keyrings/cloud.google.gpg && \
    apt update && \
    apt install -y google-cloud-cli python3 && \
    yes | gcloud components install kubectl && \
    groupadd --gid ${USER_GID} ${USERNAME} && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} -s /bin/bash

USER ${USERNAME}