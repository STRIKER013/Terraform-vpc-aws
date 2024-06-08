locals {
  # [california: us-west-1, oregon: us-west-2 |]
  region      = "us-west-1"
  environment = "testing"
  creator     = "Terraform"
  team        = "IAC"
  entity      = "OmarParra"

  tags = {
    Environment = local.environment
    Creator     = local.creator
    Team        = local.team
    Entity      = local.entity
  }

  pub_subnets_cidr = {
    "${local.region}a" = "10.0.1.0/24"
    "${local.region}b" = "10.0.2.0/24"
  }

  pri_subnets_cidr = {
    "${local.region}a" = "10.0.3.0/24"
    "${local.region}b" = "10.0.4.0/24"
  }

}

# ------------------------------------------------------------------------------
# VPC
# ------------------------------------------------------------------------------

variable "vpc_cidr_block" {
  description = "CIDR IP Block to be assigned in VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "routing_table_cidr_block" {
  description = "CIDR IP Block to be assigned in Routing Table"
  type        = string
  default     = "0.0.0.0/0"
}
