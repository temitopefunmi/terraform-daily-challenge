provider "azurerm" {
  features {
    
  }
  subscription_id = "91b5861d-1382-40df-a5c9-3182f79cff35"
}

resource "azurerm_resource_group" "terra-rg" {
  name = var.resource_group_name
  location = var.location
}