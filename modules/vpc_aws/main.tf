# ------------------------------------------------------------------------------
# AWS NETWORKING
# ------------------------------------------------------------------------------

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-${var.entity}-${var.environment}"
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.main.id
  for_each                = var.pub_subnets_cidr
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-net-${each.key}"
  }
  depends_on = [aws_vpc.main]
}

# PRIVATE SUBNETS
resource "aws_subnet" "private_subnets" {
  vpc_id                  = aws_vpc.main.id
  for_each                = var.priv_subnets_cidr
  cidr_block              = each.value
  availability_zone       = each.key

  tags = {
    Name = "priv-net-${each.key}"
  }
  depends_on = [aws_vpc.main]
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "gw-${var.entity}-${var.environment}"
  }
  depends_on = [aws_vpc.main]
}

# ROUTING TABLE FOR PUBLIC SUBNETS
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.routing_table_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "rt-public-${var.entity}-${var.environment}"
  }
  depends_on = [aws_vpc.main]
}

# ROUTING TABLE ASSOCIATION FOR PUBLIC SUBNETS
resource "aws_route_table_association" "public_rt_association" {
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
  depends_on     = [aws_subnet.public_subnets, aws_route_table.public_rt]
}

# ROUTING TABLE FOR PRIVATE SUBNETS
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "rt-private-${var.entity}-${var.environment}"
  }
  depends_on = [aws_vpc.main]
}

# ROUTING TABLE ASSOCIATION FOR PRIVATE SUBNETS
resource "aws_route_table_association" "private_rt_association" {
  for_each       = aws_subnet.private_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_rt.id
  depends_on     = [aws_subnet.private_subnets, aws_route_table.private_rt]
}
