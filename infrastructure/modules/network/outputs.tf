output "vpc_id" {
  value = aws_vpc.create_vpc.id
}

output "subnets_id" {
  value = [for subnet in aws_subnet.subnets : subnet.id]
}