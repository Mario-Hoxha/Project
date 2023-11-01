output "eks_cluster_role" {
  value = aws_iam_role.eks-iam-role
}

output "worker_nodes" {
  value = aws_iam_role.workernodes
}

output "eks-name" {
  value = aws_eks_cluster.eks-cls
}
output "ecr_repository_url" {
  value = aws_ecr_repository.mh-repository.repository_url
}