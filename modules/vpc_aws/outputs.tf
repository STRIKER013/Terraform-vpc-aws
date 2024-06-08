# ------------------------------------------------------------------------------
# OUTPUTS
# ------------------------------------------------------------------------------

# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

# Output the public subnets
output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = [for subnet in aws_subnet.public_subnets : subnet.id]
}

# Output the private subnets
output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = [for subnet in aws_subnet.private_subnets : subnet.id]
}
