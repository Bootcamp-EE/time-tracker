#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install docker
apt-get update
curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /tmp && mkdir jenkins
export jenkins_path="/tmp/jenkins"
pwd
cd ci
pwd
sudo chmod +rwx docker-install.sh
sh docker-install.sh
sudo docker-compose up -d
