terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73.0"
     }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }
  }
}
provider "aws" {
  region              = var.region
  allowed_account_ids = [var.aws_account_id]
}
