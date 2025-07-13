

module "vpc" {
  source = "./modules/vpc"

  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr

  subnet_1_name      = var.subnet_1_name
  subnet_1_cidr      = var.subnet_1_cidr
  subnet_1_az        = var.subnet_1_az

  route_table_name   = var.route_table_name
  routetable_cidrs   = var.routetable_cidrs

  internet_gateway_name = var.internet_gateway_name

  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description

  ingress_cidr_block = var.ingress_cidr_block
  egress_cidr_block  = var.egress_cidr_block
}
