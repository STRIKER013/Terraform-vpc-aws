terraform {
  cloud {
    organization = "cloud-aws-clases"
    workspaces {
      name = "iac-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.1"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = local.region

    default_tags {
    tags = local.tags
  }
}