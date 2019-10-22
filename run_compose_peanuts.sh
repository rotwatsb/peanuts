#!/bin/bash

export ENV=testing
export RPC_USER=localdev
export RPC_PASSWORD=localdev
export RPC_CLIENT_HOST=btcwrapp
docker-compose run --service-ports peanuts-app pipenv run python run_peanuts_wsgi.py
