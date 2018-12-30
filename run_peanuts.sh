#!/bin/bash

# run as: ./run_peanuts.sh RPC_USER RPC_PASSWORD
RPC_USER=$1
RPC_PASSWORD=$2

export RPC_USER RPC_PASSWORD

docker-compose up
