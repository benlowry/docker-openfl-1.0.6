#!/bin/sh
if [ "$1" = "clean" ];
then
    docker rm `docker ps -a -q` && docker rmi `docker images -a -q`
fi

docker build --rm=true -t openfl/106 --no-cache .
docker run -t -i openfl/106 /bin/bash
