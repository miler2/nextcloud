#!/bin/bash

set -x
apt update -y
#apt upgrade -y

#Instalamos docker en nuestra máquina
apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y

apt install docker-ce -y

<<<<<<< HEAD

#Instalamos el servidor web Apache

apt install apache2 -y

#Instalamos el sistema gestor de bases de datos MySQL

apt install mysql-server -y

#Instalamos php

apt install php libapache2-mod-php php-mysql -y

#Reiniciamos el servidor para aplicar los cambios
systemctl restart apache2

#Modificamos el propietario y el grupo del directorio /var/www/html para
#que la persona que abra esta página desde la web tenga permisos.
#El comando "-R" para hacer los cambios de forma recursiva.

chown -R www-data:www-data /var/www/html

=======
>>>>>>> 55db1cc9e2713d38b8154ecae3edda7792a7351b
#Iniciamos el contenedor para NextCloud

docker run --init --sig-proxy=false --name nextcloud-aio-mastercontainer --restart always --publish 8080:8080 --publish 8443:8443 --volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config --volume /var/run/docker.sock:/var/run/docker.sock:ro nextcloud/all-in-one:latest