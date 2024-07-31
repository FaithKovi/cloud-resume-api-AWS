terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket1232444231"
    key            = "./terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "resume-terraform-locks"
    encrypt        = true
  }
}
