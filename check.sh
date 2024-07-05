#!/bin/bash

# Use the environment variables passed by GitHub Actions
Image_ID=$AMI_ID
INSTANCE_TYPE=$INSTANCE_TYPE
KEY_PAIR_NAME=$KEY_PAIR
SECURITY_GROUP_NAME=$SECURITY_GROUP_NAME

# Debugging: Print the environment variables
echo "Using Image ID: $Image_ID"
echo "Using Instance Type: $INSTANCE_TYPE"
echo "Using Key Pair Name: $KEY_PAIR_NAME"
echo "Using Security Group Name: $SECURITY_GROUP_NAME"
