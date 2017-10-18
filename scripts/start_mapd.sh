#!/bin/sh
nvidia-docker run --name mapd \
    --restart always \
    --detach \
    --publish 127.0.0.1:9092:9092 \
    --volume /mapd-storage/data:/mapd-storage/data \
    --volume /mapd-storage/ingest:/mapd-storage/ingest \
    mapd/mapd-ce-cuda:v3.2.1
