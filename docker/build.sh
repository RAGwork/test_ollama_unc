#!/bin/bash

set -x

IM_VERSION=1.0

IM=famaf-unc/rag:$IM_VERSION

echoerr() { echo "$@" 1>&2; }

prog_exists() {
    if ! command -v $1 &> /dev/null
    then
        echoerr $1 cannot be found
        exit 1
    fi
}

for prg in realpath docker grep
do
    prog_exists $prg
done

DIRNAME="$(dirname "$0")"

# Stop all containers
for c in $(docker ps -a -q  --filter ancestor=$IM)
do
    docker stop $c
done

if [ -n "$(docker images -q $IM 2>/dev/null)" ]
then
    docker image rm $IM
fi

docker build --tag $IM -f "$DIRNAME"/Dockerfile "$@" "$DIRNAME"/context

