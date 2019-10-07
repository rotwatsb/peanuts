#!/bin/bash

# run as: ./compose_peanuts.sh FLASK_ENV RPC_USER RPC_PASSWORD RPC_CLIENT_HOST
FLASK_ENV=$1
RPC_USER=$2
RPC_PASSWORD=$3
RPC_CLIENT_HOST=$4

export FLASK_ENV RPC_USER RPC_PASSWORD RPC_CLIENT_HOST

docker-compose up --force-recreate
