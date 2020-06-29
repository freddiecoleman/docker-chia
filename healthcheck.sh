#!/bin/bash

hostname=$(hostname)

response_code=$(curl -sL -w "%{http_code}" --location --request POST "http://$hostname:8555/get_blockchain_state" --header 'Content-Type: text/plain' --data-raw '{}' -o /dev/null)

if [ "$response_code" == "200" ]; then
    exit 0
else
    exit 9
fi
