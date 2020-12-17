#!/bin/bash

NGINX_PID=$1

# Instead of trying to run `cron` or something like that, just sleep and run `certbot`.
while [ true ]; do
    # Make sure we do not run container empty (without nginx process).
    # If nginx quit for whatever reason then stop the container.
    # Leave the restart decision to the container orchestration.
    if ! ps aux | grep --quiet [n]ginx ; then
        exit 1
    fi

    # Run certbot, tell nginx to reload its config
    echo "Run certbot"
    /scripts/run_certbot.sh
    kill -HUP $NGINX_PID

    # Sleep for 1 week
    sleep 604810 &
    SLEEP_PID=$!

    # Wait for 1 week sleep or nginx
    wait -n "$SLEEP_PID" "$NGINX_PID"
done