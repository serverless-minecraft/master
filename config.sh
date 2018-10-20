export StackName="minecraft-cluster"
export region="ap-southeast-2"
export logGroupName=$StackName
export domainName="mc.bofh.net.au"
export repositoryName="minecraft"
aws configure set region $region
export AWS_REGION=$region
export AWS_DEFAULT_REGION=$region

export zoneID=$(aws route53 list-hosted-zones --query "HostedZones[?Name==\`$domainName.\`].Id" --output text | cut -d'/' -f3)
