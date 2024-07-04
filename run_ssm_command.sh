#!/bin/bash

# Variables
INSTANCE_ID=$(cat instance_id.txt)

# Run the script using SSM
aws ssm send-command --instance-ids $INSTANCE_ID --document-name "AWS-RunShellScript" --parameters commands="chmod +x /home/ubuntu/install_minecraft_server.sh; /home/ubuntu/install_minecraft_server.sh"

