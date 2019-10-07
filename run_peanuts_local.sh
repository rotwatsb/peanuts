#!/bin/bash

export FLASK_APP=peanuts
export RPC_USER=localdev
export RPC_PASSWORD=localdev

pipenv run python run_peanuts_wsgi.py
