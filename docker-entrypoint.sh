#!/bin/bash

cd /chia-blockchain
. ./activate
chia init
chia keys generate
chia start node -r
tail -f /dev/null