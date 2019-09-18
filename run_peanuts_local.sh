#!/bin/bash

export FLASK_APP=peanuts
export RPC_USER=localdev
export RPC_PASSWORD=localdev
export RPC_BITCOIN_HOST=localhost

pipenv run flask run --host=0.0.0.0 --port=5000
