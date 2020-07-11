#!/bin/bash

cd /chia-blockchain
. ./activate
chia init
chia keys generate
sed -i 's/localhost/chia/g' /root/.chia/beta-1.0b8.dev192/config/config.yaml \
chia start node -r
tail -f /dev/null