variable "kv_name" {
  type = string
  description = "The name of the Key Vault"
  
}

/***** COMMON VARIABLES *****/

variable "resource_group_name" {
  type = string
  description = "The name of the Resource Group to create the resources in."
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
variable "ip_rules" {
  type = list
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
  default = []
}

variable "virtual_network_subnet_ids" {
  type = list
  description = "One or more Subnet ID's which should be able to access this Key Vault."
  default = []
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

variable "network_acl_bypass" {
  type        = string
  description = "pecifies which traffic can bypass the network rules. Possible values are AzureServices and None."
  default     = "None"
}