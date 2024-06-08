
# ------------------------------------------------------------------------------
# VPC
# ------------------------------------------------------------------------------
variable "region" {
  description = "The AWS region to use to create resources."
  default     = "us-west-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "pub_subnets_cidr" {
  description = "CIDR blocks for the public subnets"
  type        = map(string)
}

variable "priv_subnets_cidr" {
  description = "CIDR blocks for the private subnets"
  type        = map(string)
}

variable "routing_table_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}

variable "entity" {
  description = "Entity name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
