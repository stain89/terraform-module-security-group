variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region where Security Group will be provisioned"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC ID in which Security Group will be provisioned"
}

variable "name" {
  type        = string
  default     = "test"
  description = "Name of product to which resource belongs to"
}

variable "environment" {
  type        = string
  default     = "test"
  description = "Environment resource belong to. Ex Dev/Test/Prod"
}