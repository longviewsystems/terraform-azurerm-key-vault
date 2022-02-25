# Description
This module creates a Key Vault to hold secrets.
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
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=2.91.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.97.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_role_assignment.rbac_keyvault_administrator](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rbac_keyvault_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rbac_keyvault_secrets_users](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_objects_ids"></a> [admin\_objects\_ids](#input\_admin\_objects\_ids) | Ids of the objects that can do all operations on all keys, secrets and certificates | `list(string)` | `[]` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. | `bool` | `true` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `bool` | `false` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault. | `list(any)` | `[]` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | The name of the Key Vault | `string` | n/a | yes |
| <a name="input_network_acl_bypass"></a> [network\_acl\_bypass](#input\_network\_acl\_bypass) | pecifies which traffic can bypass the network rules. Possible values are AzureServices and None. | `string` | `"None"` | no |
| <a name="input_reader_objects_ids"></a> [reader\_objects\_ids](#input\_reader\_objects\_ids) | Ids of the objects that can read all keys, secrets and certificates | `list(string)` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group to create the resources in. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The Name of the SKU used for this Key Vault. Possible values are: Standard, and Premium. | `string` | `"standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags for Azure Resources | `map(string)` | <pre>{<br>  "TFLevel": "L0",<br>  "costCenter": "",<br>  "environment": "Production",<br>  "managedBy": "Terraform",<br>  "owner": ""<br>}</pre> | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | One or more Subnet ID's which should be able to access this Key Vault. | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kv_id"></a> [kv\_id](#output\_kv\_id) | The location used for the Key Vault. |
| <a name="output_kv_name"></a> [kv\_name](#output\_kv\_name) | The name of the Key Vault. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->