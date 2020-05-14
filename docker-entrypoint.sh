#!/bin/bash

cd /chia-blockchain
. ./activate
chia init
yes | chia generate keys
chia start node -r
