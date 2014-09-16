#!/bin/sh
if [ "$1" = "clean" ];
then
    docker rm `docker ps -a -q` && docker rmi `docker images -a -q`
fi

if [ ! -f "android-ndk.tar.gz" ]; then
    curl -L -o android-ndk.tar.gz https://www.dropbox.com/s/mgve63yj4ht6rxs/android-ndk.tar.gz?dl=1
fi

if [ ! -f "android-sdk.tar.gz" ]; then
    curl -L -o android-sdk.tar.gz https://www.dropbox.com/s/5f2kzosdm03mxul/android-sdk.tar.gz?dl=1
fi

if [ ! -f "apache-ant.tar.gz" ]; then
    curl -L -o apache-ant.tar.gz https://www.dropbox.com/s/b4jlmw3nvc45vff/apache-ant.tar.gz?dl=1
fi

docker build --rm=true -t openfl/106 --no-cache .
docker run -t -i openfl/106 /bin/bash
