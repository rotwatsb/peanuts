#!/bin/bash

docker run \
       -e ENV='development' \
       -e RPC_USER='localdev' \
       -e RPC_PASSWORD='localdev' \
       -p 5000:5000 \
       peanuts
