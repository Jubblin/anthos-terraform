resource "tls_private_key" "anthos_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "aad_app" {
  source           = "./modules/aad-app"
  gcp_project      = var.gcp_project
  application_name = "${var.anthos_prefix}-azure-app"
}

module "cluster_vnet" {
  source = "./modules/cluster-vnet"

  name            = "${var.anthos_prefix}-azure-vnet"
  region          = var.azure_region
  aad_app_name    = "${var.anthos_prefix}-azure-app"
  sp_obj_id       = module.aad_app.aad_app_sp_obj_id
  subscription_id = module.aad_app.subscription_id
  depends_on = [
    module.aad_app
  ]
  # create_proxy = var.create_proxy
}

module "cluster_rg" {
  source    = "./modules/cluster-rg"
  name      = "${var.anthos_prefix}-azure-resource-group"
  region    = var.azure_region
  sp_obj_id = module.aad_app.aad_app_sp_obj_id
  depends_on = [
    module.aad_app
  ]
}

module "gcp_data" {
  source       = "./modules/gcp_data"
  gcp_location = var.gcp_location
  gcp_project  = var.gcp_project
}

module "anthos_cluster" {
  source                = "./modules/anthos_cluster"
  azure_region          = var.azure_region
  location              = var.gcp_location
  cluster_version       = coalesce(var.cluster_version, module.gcp_data.latest_version)
  admin_user            = var.admin_user
  anthos_prefix         = var.anthos_prefix
  resource_group_id     = module.cluster_rg.resource_group_id
  subnet_id             = module.cluster_vnet.subnet_id
  ssh_public_key        = tls_private_key.anthos_ssh_key.public_key_openssh
  project_number        = module.gcp_data.project_number
  virtual_network_id    = module.cluster_vnet.vnet_id
  tenant_id             = module.aad_app.tenant_id
  application_id        = module.aad_app.aad_app_id
  application_object_id = module.aad_app.aad_app_obj_id
  fleet_project         = "projects/${module.gcp_data.project_number}"
  depends_on = [
    module.aad_app, module.cluster_rg, module.cluster_vnet
  ]
}

module "hub_feature" {
  source     = "./modules/hub_feature"
  membership = module.anthos_cluster.fleet_membership
  depends_on = [module.anthos_cluster]
}

