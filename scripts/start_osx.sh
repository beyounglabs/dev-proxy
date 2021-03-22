#!/bin/bash

if [ ! "$EUID" -ne 0 ]
  then echo "Please don't run as root"
  exit
fi

# Create Network Consul
[[ $(docker network ls | grep consul) ]] || docker network create consul

docker-compose -f docker-compose.yml up -d
