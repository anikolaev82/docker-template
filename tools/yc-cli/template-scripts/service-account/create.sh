#!/bin/bash

export SERVICE_ACCOUNT=$(yc iam service-account create --name service-account-for-cf \
--description "service account for cloud functions" \
--format json | jq -r .)

#Create service account
yc iam service-account create --name service-account-for-cf \
--description "service account for cloud functions" \
--format json