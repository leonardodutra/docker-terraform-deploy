terraform {
  backend "s3" {
    encrypt = true
    bucket = "configuration-s3-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
  }