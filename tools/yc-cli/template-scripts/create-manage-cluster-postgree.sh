#!/bin/bash

yc manage-postgresql cluster create \
  --name my-pg-database \
  --description 'For serverless' \
  --postgresql-version 13 \
  --environment dev \
  --network-name default \
  --resource-preset b2.nano \
  --host zone-id=ru-central1-c,subnet-id=<subnet_id> \
  --disk-type network-hdd \
  --disk-size 10 \
  --user name=user1,password=pass \
  --database name=db1,owner=user1 \
  --websql-access \
  --serverless-access