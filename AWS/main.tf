module "kms" {
  source        = "./modules/kms"
  anthos_prefix = var.anthos_prefix
}

module "iam" {
  source             = "./modules/iam"
  gcp_project_number = var.gcp_project_number
  anthos_prefix      = var.anthos_prefix
  db_kms_arn         = module.kms.database_encryption_kms_key_arn
}

module "vpc" {
  source                        = "./modules/vpc"
  aws_region                    = var.aws_region
  vpc_cidr_block                = var.vpc_cidr_block
  anthos_prefix                 = var.anthos_prefix
  subnet_availability_zones     = var.subnet_availability_zones
  public_subnet_cidr_block      = var.public_subnet_cidr_block
  cp_private_subnet_cidr_blocks = var.cp_private_subnet_cidr_blocks
  np_private_subnet_cidr_blocks = var.np_private_subnet_cidr_blocks
}

module "anthos_cluster" {
  source                          = "./modules/anthos_cluster"
  anthos_prefix                   = var.anthos_prefix
  location                        = var.gcp_location
  aws_region                      = var.aws_region
  cluster_version                 = var.cluster_version
  database_encryption_kms_key_arn = module.kms.database_encryption_kms_key_arn
  iam_instance_profile            = module.iam.cp_instance_profile_id
  admin_user                      = var.admin_user
  vpc_id                          = module.vpc.aws_vpc_id
  role_arn                        = module.iam.api_role_arn
  subnet_ids                      = [module.vpc.aws_cp_subnet_id_1, module.vpc.aws_cp_subnet_id_2, module.vpc.aws_cp_subnet_id_3]
  node_pool_subnet_id             = module.vpc.aws_np_subnet_id_1
  fleet_project                   = "projects/${var.gcp_project_number}"
  depends_on                      = [module.kms, module.iam, module.vpc]
}

module "hub_feature" {
  source     = "./modules/hub_feature"
  membership = module.anthos_cluster.fleet_membership
  depends_on = [module.anthos_cluster]
}

