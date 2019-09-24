#!/bin/bash

docker run \
       -e FLASK_APP='peanuts' \
       -e RPC_USER='localdev' \
       -e RPC_PASSWORD='localdev' \
       -e RPC_BITCOIN_HOST='localhost' \
       -e APACHE_SERVER_NAME='localhost' \
       -p 5000:5000 \
       peanuts
