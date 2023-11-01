##  PROVIDER            ##

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "eu-north-1"
}

##      END-PROVIDER    ##

##      VPC             ##

resource "aws_vpc" "create_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.app_name}-vcp"
  }
}


resource "aws_subnet" "subnets" {
  for_each = var.subnets
      vpc_id     = aws_vpc.create_vpc.id
      cidr_block        = each.value
      availability_zone = "eu-north-1${each.key}"
      map_public_ip_on_launch = true 

  tags = {
    Name = "${var.app_name}-subnet-${each.key}"
  }
}

resource "aws_internet_gateway" "create-internet-gateway" {
  vpc_id = aws_vpc.create_vpc.id
  tags = {
    Name = "${var.app_name}-gateway"
  }
}

resource "aws_route_table" "create-route-table" {
  vpc_id = aws_vpc.create_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.create-internet-gateway.id
  }

  tags = {
    Name = "${var.app_name}-route-table"
  }
}

resource "aws_route_table_association" "subnet-associations" {
  for_each = var.subnets

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.create-route-table.id
}

##      VPC-END         ##