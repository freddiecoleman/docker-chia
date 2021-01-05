#!/bin/bash

hostname=$(hostname)
latest_install_config_dir=$(ls -td -- /root/.chia/* | head -n 1)/config/

response_code=$(curl -k --key ${latest_install_config_dir}/trusted.key --cert ${latest_install_config_dir}/trusted.crt -X POST  -d '{}' -sL -w "%{http_code}" https://$hostname:8555/get_blockchain_state -o /dev/null)

if [ "$response_code" == "200" ]; then
    exit 0
else
    exit 9
fi
