# # resource "aws_vpc" "custom_vpc" {
# #   cidr_block           = "10.0.0.0/16"
# #   enable_dns_support   = true
# #   enable_dns_hostnames = true
# #   tags = {
# #     Name = "tomer-vpc"
# #   }
# # }

# # data "aws_availability_zones" "available" {}

# # resource "random_shuffle" "az_random" {
# #   input        = data.aws_availability_zones.available.names
# #   result_count = 2
# # }

# # resource "aws_subnet" "public" {
# #   vpc_id                  = aws_vpc.custom_vpc.id
# #   cidr_block              = "10.0.1.0/24"
# #   map_public_ip_on_launch = true
# #   availability_zone       = random_shuffle.az_random.result[0]
# #   tags = {
# #     Name = "tomer-public-subnet"
# #   }
# # }

# # resource "aws_internet_gateway" "custom_gateway" {
# #   vpc_id = aws_vpc.custom_vpc.id
# #   tags = {
# #     Name = "tomer-igw"
# #   }
# # }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.custom_vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.custom_gateway.id
#   }
#   tags = {
#     Name = "tomer-public-rt"
#   }
# }

# resource "aws_route_table_association" "public_association" {
#   subnet_id      = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }
# Use data sources to reference existing VPC and subnet

data "aws_vpc" "selected" {
  id = "vpc-044604d0bfb707142"
}

# Get all subnets within the VPC
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}
