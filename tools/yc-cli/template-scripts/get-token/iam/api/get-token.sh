#!/bin/bash

curl -d "{\"yandexPassportOauthToken\":\"$YCOAUTH\"}" "https://iam.api.cloud.yandex.net/iam/v1/tokens"