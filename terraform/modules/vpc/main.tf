resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_1_cidr
  availability_zone = var.subnet_1_az

  tags = {
    Name = var.subnet_1_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.routetable_cidrs
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

 resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for Application Load Balancer"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}


#ecs security group
resource "aws_security_group" "ecs" {
  name        = var.ecs_security_group_name
  description = var.ecs_security_group_description
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = var.app_from_port
    to_port     = var.app_to_port
    protocol    = "tcp"
    cidr_blocks = [var.ecs_ingress_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.egress_cidr_block]
  }

  tags = {
    Name = var.ecs_security_group_name
  }
}
