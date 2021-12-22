FROM nginx:1

COPY . /tmp

# Do this apt/pip stuff all in one RUN command to avoid creating large
# intermediate layers on non-squashable docker installs
RUN apt update && \
    apt upgrade -y && \
    apt install -y dos2unix python3 python3-dev libffi6 libffi-dev libssl-dev curl build-essential procps && \
    curl -L 'https://bootstrap.pypa.io/get-pip.py' | python3 && \
    pip install -U cffi certbot && \
    apt remove --purge -y python3-dev build-essential libffi-dev libssl-dev curl && \
    openssl dhparam -out /etc/nginx/dhparam_1024.pem 1024 && \
    openssl dhparam -out /etc/nginx/dhparam_2048.pem 2048 && \
    apt clean && \
    apt autoremove --purge -y && \
    dos2unix /tmp/scripts/entrypoint.sh && \
    dos2unix /tmp/scripts/poll_certbot.sh && \
    dos2unix /tmp/scripts/run_certbot.sh && \
    dos2unix /tmp/scripts/util.sh && \
    mkdir -p /scripts/startup && \
    mv /tmp/scripts/* /scripts && \
    chmod +x /scripts/*.sh && \
    rm -f /etc/nginx/conf.d/* && \
    mv /tmp/conf.d/* /etc/nginx/conf.d && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME /etc/letsencrypt
EXPOSE 80 443

ENTRYPOINT ["/scripts/entrypoint.sh"]