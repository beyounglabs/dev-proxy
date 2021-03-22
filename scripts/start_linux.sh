#!/bin/bash

set -e

if [ ! "$EUID" -ne 0 ]
  then echo "Please don't run as root"
  exit
fi

BASEDIR=$(dirname "$0")
cd $BASEDIR/../

chmod +x nginx/entrypoint.sh

# Create Network Consul
[[ $(docker network ls | grep consul) ]] || docker network create consul

docker-compose up -d