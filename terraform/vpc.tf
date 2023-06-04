resource "aws_vpc" "VPC_teste" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "VPC teste"
}
} 

resource "aws_subnet" "Public_subnet" {
  vpc_id                  = aws_vpc.VPC_teste.id
  cidr_block              = var.publicsCIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone
tags = {
   Name = "Public subnet"
}
}

resource "aws_network_acl" "Public_NACL" {
  vpc_id = aws_vpc.VPC_teste.id
  subnet_ids = [ aws_subnet.Public_subnet.id ]

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.publicdestCIDRblock 
    from_port  = 22
    to_port    = 22
  }
  
 
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.publicdestCIDRblock
    from_port  = 22 
    to_port    = 22
  }
  
tags = {
    Name = "Public NACL"
}
}

resource "aws_internet_gateway" "IGW_teste" {
 vpc_id = aws_vpc.VPC_teste.id
 tags = {
        Name = "Internet gateway teste"
}
} 

resource "aws_route_table" "Public_RT" {
 vpc_id = aws_vpc.VPC_teste.id
 tags = {
        Name = "Public Route table"
}
} 

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.Public_RT.id
  destination_cidr_block = var.publicdestCIDRblock
  gateway_id             = aws_internet_gateway.IGW_teste.id
}

resource "aws_route_table_association" "Public_association" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.Public_RT.id
}