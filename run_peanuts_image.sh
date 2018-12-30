#!/bin/bash

# run as: ./run_peanuts_image.sh IMAGE_NAME RPC_USER RPC_PASSWORD
RPCU=RPC_USER=$2
RPCP=RPC_PASSWORD=$3

docker run -e FLASK_APP=app -e FLASK_ENV=development -p 5000:5000 $1
