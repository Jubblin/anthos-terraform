<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.aad_app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_service_principal.aad_app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azurerm_role_assignment.contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.key_vaule_admin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.user_access_admin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Name of the Azure application to create: ex: GCP-Anthos | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aad_app_id"></a> [aad\_app\_id](#output\_aad\_app\_id) | The id of the aad app registration |
| <a name="output_aad_app_obj_id"></a> [aad\_app\_obj\_id](#output\_aad\_app\_obj\_id) | The object id of the aad app registration |
| <a name="output_aad_app_sp_obj_id"></a> [aad\_app\_sp\_obj\_id](#output\_aad\_app\_sp\_obj\_id) | The object id of the aad service principal |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | The ID of the subscription |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | The ID of the tenant |
<!-- END_TF_DOCS -->