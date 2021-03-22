#!/bin/bash

set -e

if [ ! "$EUID" -ne 0 ]
  then echo "Please don't run as root"
  exit
fi

BASEDIR=$(dirname "$0")
cd $BASEDIR/../

# Create Network Consul
[[ $(docker network ls | grep consul) ]] || docker network create consul

docker-compose -f docker-compose.yml up -d

MAX_USER_WATCHES=524288
cat /etc/sysctl.conf | grep max_user_watches || (echo "fs.inotify.max_user_watches=$MAX_USER_WATCHES" | sudo tee -a /etc/sysctl.conf  && sudo sysctl -p >> /dev/null)
cat /etc/sysctl.conf | grep "max_user_watches=$MAX_USER_WATCHES" || (sudo sed -ri 's/^(fs\.inotify\.max_user_watches\=)(.*)$/\1'"$MAX_USER_WATCHES"'/g' /etc/sysctl.conf && sudo sysctl -p >> /dev/null)
