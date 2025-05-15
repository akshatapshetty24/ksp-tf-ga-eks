output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.example.endpoint
}
