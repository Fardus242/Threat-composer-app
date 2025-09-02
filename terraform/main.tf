

module "vpc" {
  source = "./modules/vpc"

  vpc_name                       = var.vpc_name
  vpc_cidr                       = var.vpc_cidr
  subnet_1_name                  = var.subnet_1_name
  subnet_1_cidr                  = var.subnet_1_cidr
  subnet_1_az                    = var.subnet_1_az
  subnet_2_name                  = var.subnet_2_name
  subnet_2_cidr                  = var.subnet_2_cidr
  subnet_2_az                    = var.subnet_2_az
  route_table_name               = var.route_table_name
  routetable_cidrs               = var.routetable_cidrs
  internet_gateway_name          = var.internet_gateway_name
  security_group_name            = var.security_group_name
  security_group_description     = var.security_group_description
  ingress_cidr_block             = var.ingress_cidr_block
  egress_cidr_block              = var.egress_cidr_block
  ecs_security_group_name        = var.ecs_security_group_name
  ecs_security_group_description = var.ecs_security_group_description
  ecs_ingress_cidr_block         = var.ecs_ingress_cidr_block
  app_from_port                  = var.app_from_port
  app_to_port                    = var.app_to_port
  private_subnet_1_cidr          = "10.0.3.0/24"
  private_subnet_1_az            = "us-east-1a"
  private_subnet_1_name          = "private-1"

  private_subnet_2_cidr = "10.0.4.0/24"
  private_subnet_2_az   = "us-east-1b"
  private_subnet_2_name = "private-2"
}


module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  alb_sg_id         = module.vpc.alb_sg_id
  security_group_id = module.vpc.alb_sg_id
  certificate_arn   = module.acm.certificate_arn
}


#ecs
module "ecs" {
  source                         = "./modules/ecs"
  cluster_name                   = var.cluster_name
  task_family                    = var.task_family
  container_name                 = var.container_name
  container_image                = var.container_image
  cpu                            = var.cpu
  memory                         = var.memory
  aws_region                     = var.aws_region
  service_name                   = var.service_name
  desired_count                  = var.desired_count
  host_port                      = var.host_port
  container_port                 = var.container_port
  subnet_ids                     = module.vpc.subnet_ids
  target_group_arn               = module.alb.target_group_arn
  ecs_security_group_name        = var.ecs_security_group_name
  ecs_security_group_description = var.ecs_security_group_description
  ecs_ingress_cidr_block         = var.ecs_ingress_cidr_block
  vpc_id                         = module.vpc.vpc_id
  app_from_port                  = var.app_from_port
  app_to_port                    = var.app_to_port
  # security_groups                = [module.vpc.ecs_security_group_id]
  ecs_security_group_id = module.vpc.ecs_security_group_id
}



module "route53" {
  source           = "./modules/route53"
  hosted_zone_name = var.hosted_zone_name  
  subdomain        = "tm"
  alb_dns_name     = module.alb.lb_dns_name
  alb_zone_id      = module.alb.lb_zone_id
}

module "acm" {
  source          = "./modules/acm"
  domain_name     = var.domain_name  
  route53_zone_id = module.route53.zone_id  
}

# "Z0874723168P4BGRP5CQS"