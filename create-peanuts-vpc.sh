#!/bin/bash

aws cloudformation create-stack --stack-name=peanuts-vpc-stack --template-body file://cloudformation/peanuts-vpc.json --parameters ParameterKey=AllowedSSHCidr,ParameterValue=$(dig +short $1)/32
