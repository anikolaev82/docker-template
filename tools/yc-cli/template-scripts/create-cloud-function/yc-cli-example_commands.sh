#!/bin/bash


#yc serverless function  create --name my-first-function

echo 'def handler(event, context):
	return {
		''statusCode'': 200,
		''body'':	''Hello''
	} >> index_trigger.py'

#yc serverless function list

#yc serverless function version list

#yc serverless function invoke <id_function>

#yc serverless function version set-tag --id <id func> --tag first
#yc serverless function version remove-tag --id <id func> --tag first

#will do this function public
#yc serverless function allow-unauthenticated-invoke my-first-function

#Added role storage.editor for Objects Storage
#yc resource-manager folder add-access-binding $YC_FOLDER_ID \
#  --role storage-editor \
#  --subject serviceAccount:$YC_SERVICE_ACCOUNT_CF

# get keys access
#yc iam access-key create --service-account-id $YC_SERVICE_ACCOUNT_CF