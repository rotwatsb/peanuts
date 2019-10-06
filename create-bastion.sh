#!/bin/bash

aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name=peanuts-bastion-stack --template-body file://cloudformation/bastion.json --parameters ParameterKey=VpcId,ParameterValue=$1 ParameterKey=AllowedSSHCidr,ParameterValue=$(dig +short $2)/32 ParameterKey=PublicSubnetIds,ParameterValue=\"$3\"
