#!/bin/bash

export PYTHONPATH=/project

pipenv install --dev
pipenv run pytest -vv

exit $?
