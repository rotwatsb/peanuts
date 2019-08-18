#!/bin/bash

export RPC_CLIENT_HOST=peanuts-app
export RPC_USER=rpcuser
export RPC_PASSWORD=rpcpw
export RPC_BITCOIN_HOST=bitcoin-service

docker-compose build
docker-compose up --abort-on-container-exit --exit-code-from peanuts-app

exit $?