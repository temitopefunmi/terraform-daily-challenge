provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = var.resource_group
  location = var.location
}

module "vnets" {
  source = "./modules/vnet"
  for_each = { 
    for vnet in var.vnets : vnet.name => vnet
  }
  resource_group = azurerm_resource_group.rg.name
  location = var.location
  vnet_name = each.value.name
  address_space = each.value.address_space
  subnets = each.value.subnets
}

resource "azurerm_virtual_network_peering" "app_hub" {
  name = "app-hub"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = module.vnets["vnet-app"].vnet_name
  remote_virtual_network_id = module.vnets["vnet-hub"].vnet_id
  allow_virtual_network_access = true

}

resource "azurerm_virtual_network_peering" "hub_app" {
  name = "hub-app"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = module.vnets["vnet-hub"].vnet_name
  remote_virtual_network_id = module.vnets["vnet-app"].vnet_id
  allow_virtual_network_access = true
}