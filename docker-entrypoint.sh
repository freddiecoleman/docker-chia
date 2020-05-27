#!/bin/bash

cd /chia-blockchain
. ./activate
chia init
yes | chia keys generate
chia start node -r
