#!/bin/bash

# docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker.list
# mesos repo
apt-key adv --keyserver keyserver.ubuntu.com --recv DF7D54CBE56151BF
echo "deb http://repos.mesosphere.com/ubuntu xenial main" > /etc/apt/sources.list.d/mesos.list

# automatic upgrade is on, so we need to keep trying the apt-get update until the lock is free
until apt-get update
do
    echo "waiting ..."
    sleep 60
done

systemctl mask mesos-slave mesos-master marathon

until apt-get install -y docker-ce mesos marathon zookeeper virtualenv jq
do
    echo "waiting ..."
    sleep 60
done

usermod -aG docker ubuntu

# nvidia-docker
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb
usermod -aG nvidia-docker ubuntu

# cudnn 8
dpkg -i /tmp/libcudnn6_6.0.21-1+cuda8.0_amd64.deb
dpkg -i /tmp/libcudnn6-dev_6.0.21-1+cuda8.0_amd64.deb

# minpy
pip install minpy

# mapd
docker pull mapd/mapd-ce-cuda:v3.2.4
# nvidia-docker run --name mapd \
#                   --restart always \
#                   --detach \
#                   --publish 127.0.0.1:9092:9092 \
#                   --volume /mapd-storage/data:/mapd-storage/data \
#                   --volume /mapd-storage/ingest:/mapd-storage/ingest \
#                   mapd/mapd-ce-cuda:v3.2.4

# mesos
mkdir -p /etc/mesos-slave
mkdir -p /etc/marathon/conf
echo "docker/runtime,filesystem/linux,cgroups/devices,gpu/nvidia" > /etc/mesos-slave/isolation
echo "appc,docker" > /etc/mesos-slave/image_providers
echo gpu_resources > /etc/marathon/conf/enable_features
systemctl unmask mesos-slave mesos-master marathon
systemctl enable mesos-slave mesos-master marathon

