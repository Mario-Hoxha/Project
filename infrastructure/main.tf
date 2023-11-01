module "network" {
  source = "./modules/network"
  app_name = var.app_name
}

module "eks_cluster" {
  source = "./modules/eks"
  subnets = module.network.subnets_id
  app_name = var.app_name
}

module "database" {
  source = "./modules/database"
  app_name = var.app_name
  subnets = module.network.subnets_id
  vpc_id = module.network.vpc_id
  DbName = var.DB_NAME
  DbPassword = var.DB_PASSWORD
  DbUser = var.DB_USERNAME
}

module "s3_bucket" {
  source = "./modules/s3-bucket"
  app_name = var.app_name
}