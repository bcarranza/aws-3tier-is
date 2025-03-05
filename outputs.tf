output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "public_subnets" {
  description = "Public subnets"
  value       = [for subnet in aws_subnet.public_subnets : subnet.id]
}

output "private_subnets" {
  description = "Private subnets"
  value       = [for subnet in aws_subnet.private_subnets : subnet.id]
}



