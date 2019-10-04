#!/bin/bash

# example: ./create-peanuts-ecs.sh vpc-06c08a682f6e53e36 bastion_ip_address subnet-0fb412065aebaae6a\,subnet-0f11f2ca3780dd9d7 subnet-01cccbd2abe296d0b\,subnet-0d114605506dbbb47 arn:aws:servicediscovery:us-east-2:139008324031:service/srv-fcbymtpifuha4npc peanuts-vpc-stack-peanutsECSCluster-1AQX3XOBP0IG5 peanutsECSLogGroup-peanuts-vpc-stack

echo $1
echo $2
echo $3
echo $4
echo $5
echo $6
echo $7

aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name=peanuts-ecs-stack --template-body file://cloudformation/peanuts-ecs.json --parameters ParameterKey=VpcId,ParameterValue=$1 ParameterKey=AllowedSSHCidr,ParameterValue=$2/32 ParameterKey=PublicSubnetIds,ParameterValue=\"$3\" ParameterKey=PrivateSubnetIds,ParameterValue=\"$4\" ParameterKey=PrivateDnsNamespaceId,ParameterValue=$5 ParameterKey=ECSClusterName,ParameterValue=$6 ParameterKey=CloudwatchLogsGroupName,ParameterValue=$7
