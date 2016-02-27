#!/bin/bash

if [ PB_BODY ]

then

curl --header "Access-Token: $PB_TOKEN" \
       --header 'Content-Type: application/json' \
       --data-binary "$PB_BODY" \
       --request POST \
       https://api.pushbullet.com/v2/pushes

fi
