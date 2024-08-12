#!/bin/bash

##################################
#
# Author: Leju B
# Date: 10/08/2024
# version: v1
#
# To report the AWS resource usage
#
###################################

# AWS s3
# EC2
# Lambda
# IAM

set -x
set -e
set -o pipefail

# list S3 Buckets
aws s3 ls > resourceTracker

# list EC2 instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list lambda
aws lambda list-functions >> resourceTracker

# list IAM users
aws iam list-users >> resourceTracker


