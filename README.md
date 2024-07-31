# AWS RESUME API PROJECT
[![Deploy](https://github.com/FaithKovi/cloud-resume-api-AWS/actions/workflows/deploy.yml/badge.svg)](https://github.com/FaithKovi/cloud-resume-api-AWS/actions/workflows/deploy.yml)

URL:
https://hrfvt0vr0f.execute-api.us-east-1.amazonaws.com/dev/resume/45fc47d4-4f3e-46e5-b9b8-357bba4ada68


This project is about creating a serverless function that fetches resume data stored in a NoSQL Database and returns it in JSON format. 


## Stack
- Serverless Function: AWS Lambda
- API: API gateway
- Infrastructure as Code: Terraform 
- CI/CD: Github Actions
- MoSQL database: DynamoDB

## Installations
###### Install the following locally to run this project:
- Python
- Terraform
- AWS CLI (Set up your AWS profile)

## Run Locally
### Upload resume
Upload your resume in `json` format to the `terraform` folder

### Make the scripts executable
###### The local deployment script
```
$ chmod +x ./start.sh
```
###### The scripts in the infrastructure
```
$ cd terraform/scripts
$ chmod +x ./upload_resume.py
$ chmod +x ./upload_to_s3.sh
```

###### Run the start script
```
$ ./start.sh

```
###### What does the above script do?
- Zips function folder
- Deploy infrastructure with Terraform (which also includes uploading the resume to dynamodb and uploading the function to AWS Lambda)

