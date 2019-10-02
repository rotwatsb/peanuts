#!/bin/bash

export FLASK_APP=peanuts
export RPC_USER=localdev
export RPC_PASSWORD=localdev
export RPC_BITCOIN_HOST=localhost

pipenv run python run_peanuts_wsgi.py
