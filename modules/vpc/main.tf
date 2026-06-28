#############################################
# Common Tags
#############################################

locals {

  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Compliance  = "HIPAA"
  }

}

#############################################
# VPC
#############################################

resource "aws_vpc" "this" {

  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.project_name}-vpc"
    }
  )

}

#############################################
# Internet Gateway
#############################################

resource "aws_internet_gateway" "this" {

  vpc_id = aws_vpc.this.id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.project_name}-igw"
    }
  )

}

#############################################
# Public Subnet
#############################################

resource "aws_subnet" "public" {

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.project_name}-public-subnet"
      Tier = "Public"
    }
  )

}

#############################################
# Private Application Subnet
#############################################

resource "aws_subnet" "private_app" {

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_app_subnet_cidr
  availability_zone = var.availability_zone

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.project_name}-private-app-subnet"
      Tier = "Application"
    }
  )

}

#############################################
# Private Database Subnet
#############################################

resource "aws_subnet" "private_db" {

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_db_subnet_cidr
  availability_zone = var.availability_zone

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.project_name}-private-db-subnet"
      Tier = "Database"
    }
  )

}

#############################################
# Elastic IP
#############################################

resource "aws_eip" "nat" {

  count = var.create_nat_gateway ? 1 : 0

  domain = "vpc"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.project_name}-nat-eip"
    }
  )

}

#############################################
# NAT Gateway
#############################################

resource "aws_nat_gateway" "this" {

  count = var.create_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public.id

  depends_on = [
    aws_internet_gateway.this
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.project_name}-nat"
    }
  )

}
