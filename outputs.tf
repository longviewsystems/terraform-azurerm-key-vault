output "KV_name" {
  value       = azurerm_key_vault.KV.location
  description = "The name of the Key Vault."
}


output "KV_ID" {
  value       = azurerm_key_vault.KV.id
  description = "The location used for the Key Vault."
}

