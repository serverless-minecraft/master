
# The below is the most likely thing to need changing
export domainName="mc.bofh.net.au"
export region="ap-southeast-2"

# The rest below here you probably don't need to change
export StackName="minecraft-cluster"
export logGroupName=$StackName
export repositoryName="minecraft"
aws configure set region $region
export AWS_REGION=$region
export AWS_DEFAULT_REGION=$region