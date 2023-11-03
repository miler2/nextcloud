#!/bin/bash

set -x
apt update -y
#apt upgrade -y

#Instalamos docker en nuestra máquina
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
apt install docker-ce -y

#Iniciamos el contenedor para NextCloud
docker run --init --sig-proxy=false --name nextcloud-aio-mastercontainer --restart always --publish 8080:8080 --publish 8443:8443 --volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config --volume /var/run/docker.sock:/var/run/docker.sock:ro nextcloud/all-in-one:latest