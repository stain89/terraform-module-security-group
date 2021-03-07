# Provider
provider "aws" {
  region = var.aws_region
}

# Security Group
resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  name   = "${var.name}-sg"
  tags = {
    Name        = "${var.name}-sg"
    Environment = var.environment
  }
}

