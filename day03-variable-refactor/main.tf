provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "zenith-rg" {
  name = var.resource_group_name
  location = var.location
}