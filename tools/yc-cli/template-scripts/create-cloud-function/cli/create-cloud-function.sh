#!/bin/bash


while getopts n:f: flag;
 do
  echo "flag ${flag}"
    case "${flag}" in
        n) funcname=${OPTARG} ;;
        f) fname=${OPTARG} ;;
        *) echo "not valid param $flag"
    esac
done

yc serverless function version create \
  --function-name $funcname \
  --memory 256m \
  --execution-timeout 5s \
  --runtime python37 \
  --entrypoint index.handler \
  --service-account-id $YC_SERVICE_ACCOUNT_CF \
  --source-path $fname \
  --environment ACCESS_KEY=$YC_ACCESS_KEY
