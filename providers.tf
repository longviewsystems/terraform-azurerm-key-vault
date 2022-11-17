terraform {
  required_version = ">= 1.0.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.88.1, < 3.0.0"
    }
  }
}

#provider "azurerm" {
#  features {
#    key_vault {
#      purge_soft_delete_on_destroy = true
#    }
# }
#}

# provider "azurerm" {
#   features {}
#   subscription_id = ""
# }