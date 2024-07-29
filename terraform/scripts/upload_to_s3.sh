#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

BUCKET_NAME=$1
LAMBDA_S3_KEY=$2
LAMBDA_ZIP_PATH=$3

# upload lambda function to s3
echo "Uploading lambda_function.zip to s3"
aws s3 cp $LAMBDA_ZIP_PATH s3://$BUCKET_NAME/$LAMBDA_S3_KEY
