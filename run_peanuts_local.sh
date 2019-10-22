#!/bin/bash

export ENV=development
export RPC_USER=localdev
export RPC_PASSWORD=localdev

pipenv run python run_peanuts_wsgi.py
