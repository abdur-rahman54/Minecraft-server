#!/bin/bash

# Use the existing security group from GitHub Secrets
AMI_ID=$IMAGE_ID
INSTANCE_TYPE=$INSTANCE_TYPE
KEY_NAME=$KEY_PAIR_NAME
SECURITY_GROUP_NAME=$SECURITY_GROUP_NAME

# Creating Security Group ID
SECURITY_GROUP_ID=$(aws ec2 describe-security-groups --group-names $SECURITY_GROUP_NAME --query 'SecurityGroups[0].GroupId' --output text)

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

