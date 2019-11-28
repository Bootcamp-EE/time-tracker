#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install docker
apt-get update
curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /var && sudo mkdir /jenkins && mkdir ci
cp -a /../tmp/ci/. /var/ci
sudo file -s /dev/xvdh | grep -v  'XFS'>/dev/null &&  mkfs -t xfs /dev/xvdh
sudo mount /dev/xvdh /jenkins
export jenkins_path="/tmp/jenkins"
cd ci
sudo chmod +rwx docker-install.sh
sh docker-install.sh
sudo docker-compose up -d
