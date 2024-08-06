terraform {
  backend "s3" {
    bucket         = "tfstate321231"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "app-state"
    encrypt        = true
  }
}
