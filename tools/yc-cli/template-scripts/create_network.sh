#bin/bash

yc vpc network create --name my-network

yc vpc subnet create --name my-subnet-1 \
  --zone ru-central1-a \
  --range 192.168.1.0/24 \
  --network-name my-network