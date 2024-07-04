#!/bin/bash

# Load environment variables from GitHub Secrets
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
export KEY_NAME=$KEY_PAIR_NAME
export SECURITY_GROUP_NAME=$SECURITY_GROUP_NAME

# Create EC2 instance and get its public DNS
./create_ec2_instance.sh

# Run the Minecraft installation script on the EC2 instance
./run_ssm_command.sh

# Display the public DNS
PUBLIC_DNS=$(cat public_dns.txt)
echo "Minecraft server setup complete. Connect to your server at: $PUBLIC_DNS:25565"

