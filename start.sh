#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Zip the lambda function folder, excluding the virtualenv
cd ./lambda_function
zip -r ../terraform/lambda_function.zip . -x "venv/*"
echo "Lambda function zipped"

# # Create S3 backend
# cd ../terraform
# ./scripts/s3_backend.sh
# echo "S3 backend created"

# Deploy infrastructure using Terraform
cd ../terraform
terraform init
terraform apply -auto-approve -var-file="variables.tfvars"
