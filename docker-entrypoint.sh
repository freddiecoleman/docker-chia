#!/bin/bash

cd /chia-blockchain
. ./activate
chia init
chia keys generate
chia start node
tail -f /dev/null