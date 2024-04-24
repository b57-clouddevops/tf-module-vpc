# Provisions VPC
resource "aws_vpc" "main" {
  cidr_block            = var.VPC_CIDR
  instance_tenancy      = "default"


  tags = {
    Name = "roboshop-${var.ENV}-vpc"
  }
}

variable "ENV" {}