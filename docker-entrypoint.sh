#!/bin/bash

cd /chia-blockchain
. ./activate
chia init
chia generate keys
chia start node
