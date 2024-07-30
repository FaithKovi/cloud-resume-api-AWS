import boto3
import os

def get_bucket_name(tfvars_file):
    with open(tfvars_file, 'r') as file:
        for line in file:
            if line.startswith("bucket_name"):
                return line.split('=')[1].strip().replace('"', '')

def empty_bucket(bucket_name):
    s3 = boto3.resource('s3')
    bucket = s3.Bucket(bucket_name)
    bucket.objects.all().delete()

if __name__ == "__main__":
    tfvars_file = 'variables.tfvars'
    bucket_name = get_bucket_name(tfvars_file)
    print(f"Emptying bucket: {bucket_name}")
    empty_bucket(bucket_name)
    print("Bucket emptied successfully.")
