#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
BUCKET_NAME="terraform-state-bucket1232444231"
TABLE_NAME="resume-terraform-locks"
REGION="us-east-1"

# Check if the S3 bucket already exists
if aws s3api head-bucket --bucket "$BUCKET_NAME" --region "$REGION" 2>/dev/null; then
  echo "S3 bucket $BUCKET_NAME already exists in region $REGION."
else
  echo "S3 bucket $BUCKET_NAME does not exist. Creating it now..."
  aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION"
  echo "S3 bucket $BUCKET_NAME created successfully."
fi

# Check if the DynamoDB table already exists
if aws dynamodb describe-table --table-name "$TABLE_NAME" --region "$REGION" 2>/dev/null; then
  echo "DynamoDB table $TABLE_NAME already exists in region $REGION."
else
  echo "DynamoDB table $TABLE_NAME does not exist. Creating it now..."
  aws dynamodb create-table \
      --table-name "$TABLE_NAME" \
      --attribute-definitions AttributeName=LockID,AttributeType=S \
      --key-schema AttributeName=LockID,KeyType=HASH \
      --billing-mode PAY_PER_REQUEST \
      --region "$REGION"
  echo "DynamoDB table $TABLE_NAME created successfully."
fi
