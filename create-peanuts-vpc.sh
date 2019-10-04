#!/bin/bash

aws cloudformation create-stack --stack-name=peanuts-vpc-stack --template-body file://cloudformation/peanuts-vpc.json
