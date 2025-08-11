provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "vnets" {
  for_each = { for v in var.vnets : v.name => v }
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group
  address_space = each.value.address_space
}

resource "azurerm_subnet" "subnets" {
    for_each = {
        for subnet_info in flatten([
            for v in var.vnets : [
                for subnet in lookup(v, "subnets", []) : {
                    key            = "${v.name}.${subnet.name}"
                    vnet_name      = v.name
                    resource_group = v.resource_group
                    subnet_name    = subnet.name
                    address_prefix = subnet.address_prefix
      }
    ]
  ]) : subnet_info.key => {
    vnet_name       = subnet_info.vnet_name
    resource_group  = subnet_info.resource_group
    subnet_name     = subnet_info.subnet_name
    address_prefix  = subnet_info.address_prefix
  }
}
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group
  virtual_network_name = each.value.vnet_name
  address_prefixes     = [each.value.address_prefix]
}

resource "azurerm_virtual_network_peering" "app_hub" {
  name = "app-to-hub"
  resource_group_name = "zenith-rg"
  virtual_network_name = azurerm_virtual_network.vnets["vnet-app"].name
  remote_virtual_network_id = azurerm_virtual_network.vnets["vnet-hub"].id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "hub_app" {
    name = "hub-app"
    resource_group_name = "zenith-rg"
    virtual_network_name = azurerm_virtual_network.vnets["vnet-hub"].name
    remote_virtual_network_id = azurerm_virtual_network.vnets["vnet-app"].id
    allow_virtual_network_access = true
  
}