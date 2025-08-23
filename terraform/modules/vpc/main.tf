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

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_2_cidr
  availability_zone       = var.subnet_2_az

  tags = {
    Name = var.subnet_2_name
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
resource "aws_route_table_association" "public" {
subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
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

  ingress {
  description = "Allow HTTPS from anywhere"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
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


# Private Subnets
# resource "aws_subnet" "private1" {
#   vpc_id            = aws_vpc.this.id
#   cidr_block        = var.private_subnet_1_cidr
#   availability_zone = var.private_subnet_1_az

#   tags = { Name = var.private_subnet_1_name }
# }

# resource "aws_subnet" "private2" {
#   vpc_id            = aws_vpc.this.id
#   cidr_block        = var.private_subnet_2_cidr
#   availability_zone = var.private_subnet_2_az

#   tags = { Name = var.private_subnet_2_name }
# }


data "aws_availability_zones" "available" {}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = { Name = var.private_subnet_1_name }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = { Name = var.private_subnet_2_name }
}



# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}

# NAT Gateway in one of the public subnets
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.subnet1.id  # pick one public subnet
  tags          = { Name = "${var.vpc_name}-nat" }
  depends_on    = [aws_internet_gateway.gw]
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = { Name = "${var.vpc_name}-private-rt" }
}

# Private Route Table Associations
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}


resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "private-nacl" }
}

resource "aws_network_acl_rule" "private" {
  for_each       = { for i, r in var.private_nacl_config : i => r }
  network_acl_id = aws_network_acl.private.id
  rule_number    = each.value.rule_number
  egress         = each.value.egress
  protocol       = each.value.protocol
  rule_action    = each.value.rule_action
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
}

resource "aws_network_acl_association" "private" {
  count          = length([aws_subnet.private1, aws_subnet.private2])
  subnet_id      = [aws_subnet.private1.id, aws_subnet.private2.id][count.index]
  network_acl_id = aws_network_acl.private.id
}
