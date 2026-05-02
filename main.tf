terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "wilson-tfstate-bucket"   # <-- your backend bucket
    key            = "demo/terraform.tfstate"  # <-- path inside the bucket
    region         = "ap-southeast-1"
    # dynamodb_table = "wilson-tfstate-lock"     # <-- optional but recommended
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "wilson-demo-bucket-12345"
}

