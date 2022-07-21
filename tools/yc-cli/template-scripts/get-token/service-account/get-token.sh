#!/bin/bash

serviceaccount := $1
filename := "key.json"


yc iam key create --service-account-name $serviceaccount --output $filename

#if was error
#yc iam key create --folder-name <folder-name> --service-account-name <service-account-name> --output key.json

#yc iam key create --service-account-id <service-account-id> --output key.json

yc config profile create $1

yc config set service-account-key $filename

yc iam create-token