#!/usr/bin/env bash

source $PWD/env.ini

if [ "x$WORKSPACES" = "x" ]; then
    echo "Missing WORKSPACES property."
    exit -1
fi

if [ "x$PROJECT_NAME" != "x" ]; then
    PREFIX=$PROJECT_NAME
fi

case $1 in
    '')
        echo "Please enter the mode. Such as:"
        echo "env , for running env environment"
        echo "ide , for running IDE environment"
        echo "ide -debug, for debugging running."
        ;;
    'env')
        if [ ! -v $DEPENDENCIES ]; then
            echo "DEPENDENCIES is nothing."
            exit -1
        fi
        for DOCKER_IMAGE in "${!DEPENDENCIES[@]}" ; do
            DOCKER_ALIAS="${DEPENDENCIES["$DOCKER_IMAGE"]}"
            if [ -n $PREFIX ]; then
                DOCKER_ALIAS="${PREFIX}_${DOCKER_ALIAS}"
            fi
            while [ "x$(docker ps -a | grep "$DOCKER_ALIAS")" != "x" ]; do
                docker stop $DOCKER_ALIAS > /dev/null 2>&1
                docker rm -v $DOCKER_ALIAS > /dev/null 2>&1
            done
            echo "Creating $DOCKER_ALIAS container."
            nohup docker run --name $DOCKER_ALIAS $DOCKER_IMAGE > /dev/null 2>&1 &
        done

        shutdown(){
            echo
            for DOCKER_IMAGE in "${!DEPENDENCIES[@]}" ; do
                DOCKER_ALIAS="${DEPENDENCIES["$DOCKER_IMAGE"]}"
                if [ -n $PREFIX ]; then
                    DOCKER_ALIAS="${PREFIX}_${DOCKER_ALIAS}"
                fi
                echo "Stopping and removing $DOCKER_ALIAS container."
                docker stop $DOCKER_ALIAS > /dev/null 2>&1
                docker rm -v $DOCKER_ALIAS > /dev/null 2>&1
            done
            END=1
        }

        trap "shutdown" INT TERM

        echo
        echo "Environments have been started. Please using CTRL+C to quit."

        while [ "x$END" = "x" ]; do
            sleep 1
        done
        ;;
    *)
        _PREFIX="$1"
        if [ "$2" = "-debug" ]; then
            echo "Prefix is ${_PREFIX}"
        fi

        _CONTAINER="${_PREFIX^^}_CONTAINER"
        if [ "x${!_CONTAINER}" = "x" ]; then
            echo "Please provide docker image name for running."
            exit -1
        fi

        _VOLUMES_FROMS="${_PREFIX^^}_VOLUMES_FROMS"
        if [ "x${!_VOLUMES_FROMS})" != "x" ]; then
            for _volumes_from in ${!_VOLUMES_FROMS} ; do
                if [ -n ${PREFIX} ]; then
                    _volumes_from="${PREFIX}_${_volumes_from}"
                fi
                VOLUMES_FROM="$VOLUMES_FROM --volumes-from $_volumes_from"
            done
        fi

        _LINKS="${_PREFIX^^}_LINKS"
        if [ "x${!_LINKS}" != "x" ]; then
            for _link in ${!_LINKS} ; do
                if [ -n $PREFIX ]; then
                    _link="${PREFIX}_${_link}"
                fi
                LINK="$LINK --link $_link"
            done
        fi

        _EXPOSES="${_PREFIX^^}_EXPOSES"
        if [ "x${!_EXPOSES}" != "x" ]; then
            for _expose in ${!_EXPOSES} ; do
                EXPOSE="$EXPOSE --expose $_expose"
            done
        fi

        _MOUNTS="${_PREFIX^^}_MOUNTS"
        if [ "x${!_MOUNTS}" != "x" ]; then
            for _mount in ${!_MOUNTS} ; do
                MOUNT="$MOUNT -v $_mount"
            done
        fi

        _ALIAS="${_PREFIX^^}_ALIAS"
        if [ "x${!_ALIAS}" != "x" ]; then
            ALIAS="--name $!_ALIAS"
        fi

        _COMMANDS="${_PREFIX^^}_COMMANDS"
        _EXTEND_COMMANDS="${_PREFIX^^}_EXTEND_COMMANDS"

        _FINAL_COMMANDS="run --rm ${!_COMMANDS} \
            ${VOLUMES_FROM} ${LINK} ${EXPOSE} ${MOUNT} ${ALIAS} \
            ${!_CONTAINER} ${!_EXTEND_COMMANDS}"

        if [ "$2" = "-debug" ]; then
            echo "Running : "
            echo "${_FINAL_COMMANDS}"
            echo
        fi
        docker ${_FINAL_COMMANDS}
        ;;
esac