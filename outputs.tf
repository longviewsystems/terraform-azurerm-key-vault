output "kv_name" {
  value       = azurerm_key_vault.kv.location
  description = "The name of the Key Vault."
}


output "kv_id" {
  value       = azurerm_key_vault.kv.id
  description = "The location used for the Key Vault."
}

