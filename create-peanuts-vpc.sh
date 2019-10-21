#!/bin/bash

aws cloudformation create-stack --stack-name=peanuts-vpc-stack --template-body file://cloudformation/peanuts-vpc.json

STACK_STATUS="\"CREATE_IN_PROGRESS\""
while [[ "$STACK_STATUS" == "\"CREATE_IN_PROGRESS\"" ]]
do
    echo "Stack status: $STACK_STATUS"
    sleep 10
    STACK_STATUS=$(aws cloudformation describe-stacks --stack-name=peanuts-vpc-stack | jq '.["Stacks"][0]["StackStatus"]')
done

if [ "$STACK_STATUS" == "\"CREATE_COMPLETE\"" ]; then
   aws cloudformation describe-stacks --stack-name=peanuts-vpc-stack | jq '.["Stacks"][0]["Outputs"]'
fi
