# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

# Output the region of the VPC
output "vpc_region" {
  description = "The region where the VPC is deployed"
  value       = local.region
}

# Output the VPC ID from the module
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc_aws.vpc_id
}

# Output the public subnets from the module
output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = module.vpc_aws.public_subnets
}

# Output the private subnets from the module
output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = module.vpc_aws.private_subnets
}