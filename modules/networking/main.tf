resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "terraform-lab-vpc"
    Project = "terraform-aws-infrastructure"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_cidr

  availability_zone = data.aws_availability_zones.available.names[0]

  map_public_ip_on_launch = true

  tags = {
    Name    = "terraform-lab-public"
    Project = "terraform-aws-infrastructure"
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_cidr

  availability_zone = data.aws_availability_zones.available.names[1]

  map_public_ip_on_launch = false

  tags = {
    Name    = "terraform-lab-private"
    Project = "terraform-aws-infrastructure"
  }
}
