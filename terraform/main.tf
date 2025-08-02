

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



}

#ecs
module "ecs" {
  source = "./modules/ecs" 
 

  cluster_name       = var.cluster_name
  task_family        = var.task_family
  container_name     = var.container_name
  container_image    = var.container_image
  cpu                = var.cpu
  memory             = var.memory
  aws_region         = var.aws_region
  service_name       = var.service_name
  desired_count      = var.desired_count
  subnet_ids         = var.subnet_ids
  host_port          = var.host_port
  container_port     = var.container_port
  security_group_id  = var.security_group_id
  target_group_arn   = var.target_group_arn
}

#route53
module "route53" {
  source = "./modules/route53"

  zone_id        = var.route53_zone_id
  record_name    = "app"
  record_type    = "A"
  alias_name     = module.alb.lb_dns_name
  alias_zone_id  = module.alb.lb_zone_id
}
