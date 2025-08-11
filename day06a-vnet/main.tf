provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name = "zenith-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets

  name = each.key
  address_space = each.value.address_space
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

locals {
  subnet_info = flatten([                           #Flatten a list of lists into a single list of subnet config maps
    for vnet_name, vnet in var.vnets : [            # Loop over each VNET in the input map
      for subnet_name, cidr in vnet.subnets : {     # For each VNET, loop over its subnets
        key = "${vnet_name}.${subnet_name}"         # Create a unique key for the subnet (used for for_each)
        vnet_name = vnet_name                       # Store the VNET name (e.g., "vnet1")
        subnet_name = subnet_name                   # Store the subnet name (e.g., "subnetA")
        cidr = cidr                                 # Store the CIDR block for the subnet (e.g., "10.0.1.0/24")
      }
    ]
  ]
  )
}

resource "azurerm_subnet" "subnets" {
  for_each = {                                       # Start building a map for the for_each expression
    for info in local.subnet_info:                   # Start building a map for the for_each expression
      info.key => info                               # Use a unique string as the key (e.g., "vnet1.subnetA"), map to the full subnet object
  }

  name = each.value.subnet_name                      # Use the subnet name for the resource
  address_prefixes = [each.value.cidr]               # Set the CIDR block(s) for the subnet
  virtual_network_name = azurerm_virtual_network.vnets[each.value.vnet_name].name       
  # 👆 Reference the actual Terraform-created VNET resource, not just the name string from input.
  # This ensures proper dependency tracking and works even if VNET names are computed or changed dynamically.
  resource_group_name = azurerm_resource_group.rg.name                                  # Use the shared resource group for all subnets
}

resource "azurerm_virtual_network_peering" "app_hub" {
  name = "app-hub"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnets["vnet-app"].name
  remote_virtual_network_id = azurerm_virtual_network.vnets["vnet-hub"].id
  allow_virtual_network_access = true

}

resource "azurerm_virtual_network_peering" "hub_app" {
  name = "hub-app"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnets["vnet-hub"].name
  remote_virtual_network_id = azurerm_virtual_network.vnets["vnet-app"].id
  allow_virtual_network_access = true
}