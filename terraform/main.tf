

module "vpc" {
  source = "./modules/vpc"

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnet_1_name         = var.subnet_1_name
  subnet_1_cidr         = var.subnet_1_cidr
  subnet_1_az           = var.subnet_1_az
  route_table_name      = var.route_table_name
  routetable_cidrs      = var.routetable_cidrs
  internet_gateway_name = var.internet_gateway_name


  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
  ingress_cidr_block         = var.ingress_cidr_block
  egress_cidr_block          = var.egress_cidr_block


  ecs_security_group_name        = var.ecs_security_group_name
  ecs_security_group_description = var.ecs_security_group_description
  ecs_ingress_cidr_block         = var.ecs_ingress_cidr_block
  app_from_port                  = var.app_from_port
  app_to_port                    = var.app_to_port
}

module "alb" {
  source               = "./modules/alb"
  vpc_id               = module.vpc.vpc_id
  subnet_ids           = [module.vpc.subnet_id]
  # alb_sg_name          = "app-alb-sg"
  # alb_sg_description   = "App ALB Security Group"
  security_group_id    = module.vpc.alb_sg_id
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
  target_group_arn   = module.alb.target_group_arn
  security_group_id  = module.vpc.ecs_security_group_id
  security_groups    = module.vpc.ecs_security_group_id
  depends_on = [ module.alb ]
}






#route53
module "route53" {
  source         = "./modules/route53"
  
  domain_name    = var.domain_name              
  alb_dns_name   = module.alb.lb_dns_name      
  alb_zone_id    = module.alb.lb_zone_id       
}

