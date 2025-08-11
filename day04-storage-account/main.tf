resource "azurerm_storage_account" "staccount" {
  resource_group_name = var.resource_group_name
  name = var.storage_account_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}