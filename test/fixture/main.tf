/*

Setup the module for testing.

*/

locals {
  ip_data = jsondecode(data.http.my_public_ip.response_body)
}

module "kv_test" {
  source = "../../"

  resource_group_name = azurerm_resource_group.fixture.name

  location = azurerm_resource_group.fixture.location

  kv_name = module.naming.key_vault.name_unique

}


# Test module with PE
module "kv_test_with_pe" {
  source = "../../"

  resource_group_name = azurerm_resource_group.fixture.name
  location = azurerm_resource_group.fixture.location


  kv_name = module.pe_naming.key_vault.name_unique

  default_action             = "Deny"
  ip_rules                   = [local.ip_data.ip] //["108.173.252.52"]//[local.public_ip]
  virtual_network_subnet_ids = [azurerm_subnet.fixture.id]


  create_private_endpoint    = true
  private_endpoint_subnet_id = azurerm_subnet.fixture.id
  kv_private_dns_zone_ids    = [azurerm_private_dns_zone.fixture.id]

  tags = var.tags

}