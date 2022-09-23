
terraform {
  cloud {
    organization = "mohini"

    workspaces {
      name = "Mohini-Workspace"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = var.image
  instance_type = var.hw
  key_name      = var.key-name
  tags = {
    Name = var.name
  }
}

resource "aws_s3_bucket" "mohini-bucket" {

  bucket = var.bucket_name
  count  = var.bucket_creation == true ? 1 : 0
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
