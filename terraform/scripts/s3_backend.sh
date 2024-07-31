#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# create s3 bucket for terraform backend
aws s3api create-bucket --bucket terraform-state-bucket1232444231 --region us-east-1 

# create dynamodb table for state lock
aws dynamodb create-table \
    --table-name resume-terraform-locks \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region us-east-1


exit 0



