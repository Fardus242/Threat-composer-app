

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


module "acm" {
  source             = "./modules/acm"
  domain_name        = var.domain_name
  validation_method  = var.validation_method
  route53_zone_id    = var.route53_zone_id
  dns_ttl            = var.dns_ttl
}

module "alb" {
  source               = "./modules/alb"
  vpc_id               = var.vpc_id
  subnet_ids           = var.subnet_ids
  lb_security_group_id = var.lb_security_group_id

  listener_port         = var.listener_port
  listener_protocol     = var.listener_protocol
  target_group_port     = var.target_group_port
  target_group_protocol = var.target_group_protocol
  health_check_path     = var.health_check_path


  providers = {
    aws = aws.eunorth
  }
}

#ecs
module "ecs" {
  source  = "./modules/ecs"

  providers = {
    aws = aws.eunorth
  }

  cluster_name       = "app-cluster"
  task_family        = "app-task"
  container_name     = "app-container"
  container_image    = "388212729357.dkr.ecr.eu-north-1.amazonaws.com/threat-composer:latest"
  container_port     = var.container_port
  cpu                = "256"
  memory             = "512"
  aws_region         = "eu-north-1"
  service_name       = "app-service"
  desired_count      = 1
  subnet_ids         = var.subnet_ids
  security_group_id  = var.lb_security_group_id
  target_group_arn   = module.alb.target_group_arn
  host_port          = var.host_port
}

#route53
module "dns" {
  source = "./modules/route53"

  zone_id        = var.route53_zone_id
  record_name    = "app"
  record_type    = "A"
  alias_name     = module.alb.lb_dns_name
  alias_zone_id  = module.alb.lb_zone_id
}
