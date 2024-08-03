#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
BUCKET_NAME="terraform-state-bucket1232444231"
TABLE_NAME="resume-terraform-locks"
REGION="us-east-1"

# Create S3 bucket for Terraform backend
echo "Creating S3 bucket $BUCKET_NAME in region $REGION"
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION"

# Create DynamoDB table for state lock
echo "Creating DynamoDB table $TABLE_NAME in region $REGION"
aws dynamodb create-table \
    --table-name "$TABLE_NAME" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region "$REGION"

echo "Resources created successfully."