terraform {
  required_version = ">= 0.14"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0, <4.0.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "7f3c4fcf-626c-49e0-9160-a756147abaa4"
  tenant_id       = "fd6fb306-2acd-4fae-a721-c8f5714b622e"
}