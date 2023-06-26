<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_client"></a> [azure\_client](#module\_azure\_client) | ./client | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_application_certificate.aad_app_azure_client_cert](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_certificate) | resource |
| [google_container_azure_cluster.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_azure_cluster) | resource |
| [google_container_azure_node_pool.azure_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_azure_node_pool) | resource |
| [time_sleep.wait_for_aad_app_azure_client_cert](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | n/a | `any` | n/a | yes |
| <a name="input_anthos_prefix"></a> [anthos\_prefix](#input\_anthos\_prefix) | n/a | `any` | n/a | yes |
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | n/a | `any` | n/a | yes |
| <a name="input_application_object_id"></a> [application\_object\_id](#input\_application\_object\_id) | n/a | `any` | n/a | yes |
| <a name="input_azure_region"></a> [azure\_region](#input\_azure\_region) | n/a | `any` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `any` | n/a | yes |
| <a name="input_fleet_project"></a> [fleet\_project](#input\_fleet\_project) | n/a | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `any` | n/a | yes |
| <a name="input_node_pool_instance_type"></a> [node\_pool\_instance\_type](#input\_node\_pool\_instance\_type) | n/a | `any` | n/a | yes |
| <a name="input_pod_address_cidr_blocks"></a> [pod\_address\_cidr\_blocks](#input\_pod\_address\_cidr\_blocks) | n/a | `list` | <pre>[<br>  "10.200.0.0/16"<br>]</pre> | no |
| <a name="input_project_number"></a> [project\_number](#input\_project\_number) | n/a | `any` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | n/a | `any` | n/a | yes |
| <a name="input_service_address_cidr_blocks"></a> [service\_address\_cidr\_blocks](#input\_service\_address\_cidr\_blocks) | n/a | `list` | <pre>[<br>  "10.32.0.0/24"<br>]</pre> | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | n/a | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `any` | n/a | yes |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fleet_membership"></a> [fleet\_membership](#output\_fleet\_membership) | n/a |
<!-- END_TF_DOCS -->