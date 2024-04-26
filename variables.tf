variable "kv_name" {
  type        = string
  description = "The name of the Key Vault"
}

/***** COMMON VARIABLES *****/

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group to create the resources in."
}

variable "location" {
  type        = string
  description = "The location/region where the resource group will be created."
}

variable "tags" {
  type        = map(string)
  description = "List of tags for Azure Resources"
  default = {
    environment = "Production",
    costCenter  = "",
    managedBy   = "Terraform",
    owner       = "",
    TFLevel     = "L0"
  }
}

/*** RBAC ***/
variable "enable_rbac_authorization" {
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions."
  default     = true
}

variable "admin_objects_ids" {
  description = "Ids of the objects that can do all operations on all keys, secrets and certificates"
  type        = list(string)
  default     = []
}

variable "reader_objects_ids" {
  description = "Ids of the objects that can read all keys, secrets and certificates"
  type        = list(string)
  default     = []
}

/*** KV Network ACLS ***/
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether public network access is allowed for this Key Vault. Defaults to true."
  default     = false
}


variable "default_action" {
  type        = string
  description = "specificy value Deny if Keyvault needs to allowed only by private networks. Possible values are Deny and Allow."
  default     = "Allow"
}

variable "ip_rules" {
  type        = list(any)
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
  default     = []
}

variable "virtual_network_subnet_ids" {
  type        = list(any)
  description = "A list of subnet resource ids that can communicate with the Storage Account."
  default     = []
}

variable "network_acl_bypass" {
  type        = string
  description = "specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
  default     = "None"
}

/*** KV Properties ***/
variable "sku_name" {
  type        = string
  description = "The Name of the SKU used for this Key Vault. Possible values are: Standard, and Premium."
  default     = "standard"
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  default     = false
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Enable Purge Protection the the Key Vault.  Once enabled, it cannot be disabled."
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."
  default     = 7
}




/***************************************************************/
/*** Private End-points
/***************************************************************/

variable "create_private_endpoint" {
  type        = string
  default     = false
  description = "Will create a service endpoint if set to True"
}

variable "private_dns_zone_group_name" {
  type        = string
  description = "The name of the Private DNS Zone Group. "
  default     = "private-dns-zone-group"
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "Subnet ID used for private endpoint."
  default     = null
}

variable "kv_private_dns_zone_ids" {
  type        = list(string)
  description = "Private DNS Zone Ids for the blob service of Azure Storage Account."
  default     = null
}