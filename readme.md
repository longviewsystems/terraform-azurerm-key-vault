# Solution Description
This solution creates a Key Vault to hold secrets.
* Supports RBAC security for the Key Vault.  Following roles are supported:
  * Key Vault Administrator
  * reader_objects_ids are added to "Key Vault Reader" and "Key Vault Secrets User"
* Supports network ACLs with default deny.

# References: 
 * [Azure built-in roles for Key Vault data plane operations](https://docs.microsoft.com/en-us/azure/key-vault/general/rbac-guide)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.8 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =2.87.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.87.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/2.87.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.sa](https://registry.terraform.io/providers/hashicorp/azurerm/2.87.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.L0](https://registry.terraform.io/providers/hashicorp/azurerm/2.87.0/docs/resources/storage_container) | resource |
| [azurerm_storage_container.L1](https://registry.terraform.io/providers/hashicorp/azurerm/2.87.0/docs/resources/storage_container) | resource |
| [azurerm_storage_container.L2](https://registry.terraform.io/providers/hashicorp/azurerm/2.87.0/docs/resources/storage_container) | resource |
| [azurerm_storage_container.L3](https://registry.terraform.io/providers/hashicorp/azurerm/2.87.0/docs/resources/storage_container) | resource |
| [azurerm_storage_container.L4](https://registry.terraform.io/providers/hashicorp/azurerm/2.87.0/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SA_UseUniqueName"></a> [SA\_UseUniqueName](#input\_SA\_UseUniqueName) | Use a unique name for the Storage Account.  If false, there may be name conflicts. | `bool` | `true` | no |
| <a name="input_locations"></a> [locations](#input\_locations) | The location of the resources. | `map(string)` | <pre>{<br>  "primary_location": "canadacentral",<br>  "secondary_location": "canadaeast"<br>}</pre> | no |
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | The prefix for the names of the resources.  Use only lowercase characters.  Each item will be seperated by a dash. | `list(any)` | `[]` | no |
| <a name="input_naming_suffix"></a> [naming\_suffix](#input\_naming\_suffix) | The suffixes for the names of the resources.  Use only lowercase characters.  Each item will be seperated by a dash. | `list(any)` | <pre>[<br>  "lz",<br>  "000"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags for Azure Resources | `map(string)` | <pre>{<br>  "TFLevel": "L0",<br>  "costCenter": "",<br>  "environment": "Production",<br>  "managedBy": "Terraform",<br>  "owner": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_RG_name"></a> [RG\_name](#output\_RG\_name) | The name of the Resource Group created. |
| <a name="output_SA_location"></a> [SA\_location](#output\_SA\_location) | The location used for the storage account. |
| <a name="output_SA_name"></a> [SA\_name](#output\_SA\_name) | The name of the Log Analytics Workspace. |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags used for the solution. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->