output "DB_NAME" {
  value = module.database.dbname
}

output "DB_PASSWORD" {
  value = var.DB_PASSWORD
}

output "DB_USERNAME" {
  value = var.DB_USERNAME
}

output "Website_url" {
  value = module.s3_bucket.website-url
}

output "S3_Bucket_Name" {
  value = module.s3_bucket
}

output "Repo_url" {
  value = module.eks_cluster.ecr_repository_url
}

output "Eks_Name" {
  value = module.eks_cluster.eks-name
}
