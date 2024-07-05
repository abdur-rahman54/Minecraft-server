#!/bin/bash

# Use the environment variables passed by GitHub Actions
AMI_ID=$IMAGE_ID
INSTANCE_TYPE=$INSTANCE_TYPE
KEY_NAME=$KEY_PAIR_NAME
SECURITY_GROUP_NAME=$SECURITY_GROUP_NAME

# Debugging: Print the environment variables
echo "Using Image ID: $AMI_ID"
echo "Using Instance Type: $INSTANCE_TYPE"
echo "Using Key Pair Name: $KEY_NAME"
echo "Using Security Group Name: $SECURITY_GROUP_NAME"

