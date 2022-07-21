#!/bin/bash

#Set roles for service account
yc resource-manager folder add-access-binding <folfer_id> \
--subject serviceAccount:<service-account-id> \
--role editor