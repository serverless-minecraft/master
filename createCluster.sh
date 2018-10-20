#!/bin/bash -ex

. ./config.sh

# Create the log group
logGroup=`aws logs describe-log-groups --log-group-name-prefix $logGroupName --query 'logGroups[0].logGroupName'`
[ "$logGroup" = "null" ] && aws logs create-log-group --log-group-name $logGroupName

# Configure and create the cluster
./ecs-cli configure --cluster $StackName --region $region --default-launch-type FARGATE
if ( aws ecs list-clusters | grep $StackName ) ; then
    echo "Cluster already exists"
else 
    ./ecs-cli up --capability-iam --port 25565 --launch-type FARGATE
fi

# Details needed for interpreting task.yml
vpcid=$(aws ec2 describe-vpcs --filters "Name=tag:aws:cloudformation:stack-name,Values=amazon-ecs-cli-setup-$StackName" --query 'Vpcs[0].VpcId' --output text)
subnets=$(aws ec2 describe-subnets --query "Subnets[?VpcId=='$vpcid'].SubnetId" --output text)
export subnetArray=($subnets)

# Need to create and fill a dynamodb with the config data
cat templates/ecs-params-template-FARGATE.yml | sed s/SUBNET1/${subnetArray[0]}/ | sed s/SUBNET2/${subnetArray[1]}/ > templates/ecs-params-FARGATE.yml

# Fix the security to allow people to connect
sg=$(aws ec2 describe-security-groups --filters Name=vpc-id,Values=$vpcid  --query 'SecurityGroups[0].GroupId' --output text) # This has a bug, there's two sgs
aws ec2 authorize-security-group-ingress --group-id $sg --protocol tcp --port 25565 --cidr 0.0.0.0/0 || true

