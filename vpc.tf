# Provisions VPC
resource "aws_vpc" "main" {
  cidr_block            = var.VPC_CIDR
  instance_tenancy      = "default"
  enable_dns_hostnames  = true 

  tags = {
    Name = "roboshop-${var.ENV}-vpc"
  }
}