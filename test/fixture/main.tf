/*

Setup the module for testing.

*/

module "kv_test" {
  source = "../../"

  resource_group_name = azurerm_resource_group.fixture.name

  kv_name = module.naming.key_vault.name_unique

}


# Test module with PE
module "kv_test_with_pe" {
  source = "../../"

  sa_rg_name = azurerm_resource_group.fixture.name
  location   = "westus2"

  sa_name = module.pe_naming.key_vault.name_unique

  ip_rules                   = [local.public_ip] //["108.173.252.52"]//[local.public_ip]
  virtual_network_subnet_ids = [azurerm_subnet.fixture.id]

  create_private_endpoint           = true
  private_endpoint_subnet_id        = azurerm_subnet.fixture.id
  storage_blob_private_dns_zone_ids = [azurerm_private_dns_zone.fixture.id]

  tags = var.tags

}