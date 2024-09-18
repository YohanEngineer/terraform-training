resource "aws_vpc" "network" {
  cidr_block = var.vpc_cidr
  tags = {
    Environment = var.environment
  }
}

resource "aws_subnet" "subnetwork" {
  vpc_id     = aws_vpc.network.id
  cidr_block = var.subnet_cidr
  id         = var.subnet_id
  tags = {
    Environment = var.environment
  }
}

resource "aws_security_group" "security_group" {
  vpc_id = aws_vpc.network.id
  id     = var.sg_id
  tags = {
    Environment = var.environment
  }
}

# create aws security group rule to authorize ssh access
resource "aws_security_group_rule" "ssh_access" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.network.cidr_block]
  security_group_id = aws_security_group.security_group.id
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.network.id

  tags = {
    Environment = var.environment
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_vpc.network.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.network.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "public-subnet-${count.index}-${element(data.aws_availability_zones.available.names, count.index)}"
  }
}
