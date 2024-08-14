# AWS Resource Usage Reporter

**Author**: Leju B  
**Date**: 10/08/2024  
**Version**: v1

---

This script is designed to report the usage of various AWS resources, including **S3 Buckets**, **EC2 Instances**, **Lambda Functions**, and **IAM Users**.

## Features

1. **S3 Buckets**: Lists all S3 buckets in your AWS account.
2. **EC2 Instances**: Provides a list of all EC2 instance IDs.
3. **Lambda Functions**: Lists all AWS Lambda functions.
4. **IAM Users**: Retrieves a list of all IAM users.

## Prerequisites

- AWS CLI installed and configured with the necessary permissions.
- `jq` tool installed for parsing JSON output.

## Usage

1. Save the script in a file, for example, `aws_resource_tracker.sh`.
2. Make the script executable by running:  
   ```bash
   chmod +x aws_resource_tracker.sh
   ```
3. Run the script:  
   ```bash
   ./aws_resource_tracker.sh
   ```

The script outputs the resource usage details to a file named `resourceTracker`.

## Script Breakdown

- **Set Options**:
  - `set -x`: Enables a mode of the shell where all executed commands are printed to the terminal.
  - `set -e`: Causes the script to exit immediately if any command returns a non-zero exit status.
  - `set -o pipefail`: Causes a pipeline to return the exit status of the last command in the pipe that failed.

- **AWS Commands**:
  - `aws s3 ls`: Lists all S3 buckets.
  - `aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'`: Retrieves EC2 instance IDs.
  - `aws lambda list-functions`: Lists all Lambda functions.
  - `aws iam list-users`: Lists all IAM users.

---

**Note**: Ensure you have the required permissions to access AWS resources and install the AWS CLI and `jq` tool to run the script successfully.