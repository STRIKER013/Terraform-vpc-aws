module "vpc_aws" {
  source                   = "./modules/vpc_aws"
  vpc_cidr_block           = var.vpc_cidr_block
  routing_table_cidr_block = var.routing_table_cidr_block
  pub_subnets_cidr         = local.pub_subnets_cidr
  priv_subnets_cidr        = local.pri_subnets_cidr
  tags                     = local.tags
  entity                   = local.entity
  environment              = local.environment
}
