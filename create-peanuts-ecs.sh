#!/bin/bash

echo $1
echo $2
echo $3

aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name=peanuts-ecs-stack --template-body file://cloudformation/peanuts-ecs.json --parameters ParameterKey=VpcId,ParameterValue=$1 ParameterKey=SecurityGroupId,ParameterValue=$2 ParameterKey=PublicSubnetIds,ParameterValue=\"$3\" ParameterKey=PrivateSubnetIds,ParameterValue=\"$4\"
