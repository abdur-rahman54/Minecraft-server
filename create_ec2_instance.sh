#!/bin/bash

# Load environment variables from GitHub Secrets
KEY_NAME= "BossKeyPair"
SECURITY_GROUP_NAME= "Aws_Cli_SG"
INSTANCE_TYPE="t2.micro"
AMI_ID="ami-060e277c0d4cce553" # Ubuntu 24

# Create a security group
SECURITY_GROUP_ID=$(aws ec2 create-security-group --group-name $SECURITY_GROUP_NAME --description "Minecraft security group" --query 'GroupId' --output text)

# Add a rule to allow inbound traffic on port 25565 (Minecraft)
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 25565 --cidr 0.0.0.0/0

# Add a rule to allow SSH access
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 22 --cidr 0.0.0.0/0

# Launch an EC2 instance
INSTANCE_ID=$(aws ec2 run-instances --image-id $AMI_ID --count 1 --instance-type $INSTANCE_TYPE --key-name $KEY_NAME --security-group-ids $SECURITY_GROUP_ID --query 'Instances[0].InstanceId' --output text)

# Wait for the instance to be running
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

# Get the public DNS name of the instance
PUBLIC_DNS=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicDnsName' --output text)

echo "Instance ID: $INSTANCE_ID"
echo "Public DNS: $PUBLIC_DNS"

# Save the instance details to a file for later use
echo $INSTANCE_ID > instance_id.txt
echo $PUBLIC_DNS > public_dns.txt

