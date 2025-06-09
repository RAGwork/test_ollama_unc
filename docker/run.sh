#!/bin/bash

set -x

IM_VERSION=1.0
NAME=rag
IM=famaf-unc/$NAME:$IM_VERSION

DIRNAME=${0%/*}
WORKDIR="${DIRNAME}"/..
BASENAME="${0##*/}"

STATE=$(docker inspect -f '{{.State.Status}}' $NAME)

if [ "$STATE" == exited ]
then
    exec docker start -ai $IM
else
    EXTRARGS=""
    if [ -d "${WORKDIR}"/data ]
    then
        EXTRARGS="${EXTRARGS} -v ${WORKDIR}/data:/home/jovyan/data"
    fi

    exec docker run "$@" -it --rm -p ${PORT:-8888}:8888 -v "${WORKDIR}":/home/jovyan/work ${EXTRARGS} --name $NAME \
    --user root -e NB_UID=$(id -u) -e NB_GID=$(id -g) $IM
fi
