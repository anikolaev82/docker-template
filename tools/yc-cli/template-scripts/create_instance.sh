#bin/bash

yc compute instance create --name my-instance-1 \
  --hostname my-instance-1 \
  --zone ru-central1-c \
  --create-boot-disk image-family=ubuntu-2004-lts,size=30,type=network-nvme \
  --image-folder-id standard-images \
  --memory 4 --cores 2 --core-fraction 100 \
  --network-interface subnet-name=test-subnet-1,nat-ip-version=ipv4 \
  --async