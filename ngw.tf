# Allocates Public IP Address
resource "aws_eip" "ngw_ip" {
  instance = aws_instance.web.id
  domain   = "vpc"
}

# Provisions Public NAT Gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_ip.id                # Public NAT needs a public IP Address
  subnet_id     = aws_subnet.public_subnet.*.id[0]

  tags = {
    Name = "roboshop-${var.ENV}-ngw"
  }

  depends_on = [aws_internet_gateway.igw , aws_eip.ngw_ip]
}