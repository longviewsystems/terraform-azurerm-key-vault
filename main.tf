data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_private_endpoint" "sa" {
  count               = var.create_private_endpoint ? 1 : 0
  name                = "${var.kv_name}-kv-pe"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = var.private_endpoint_subnet_id

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = var.kv_private_dns_zone_ids
  }

  private_service_connection {
    name                           = "${var.kv_name}-kv-pe"
    private_connection_resource_id = azurerm_key_vault.kv.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  tags = var.tags

}

resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  resource_group_name         = data.azurerm_resource_group.rg.name
  location                    = data.azurerm_resource_group.rg.location
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enable_rbac_authorization   = var.enable_rbac_authorization
  soft_delete_retention_days  = 7
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.sku_name

  network_acls {
    bypass                     = var.network_acl_bypass
    default_action             = var.default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  tags = var.tags
}