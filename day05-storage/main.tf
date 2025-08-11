
data "azurerm_storage_account" "existing" {
  name = var.existing_storage
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_container" "stcontainer" {
  name = "mycontainer"
  storage_account_name = data.azurerm_storage_account.existing.name
  container_access_type = "private"
}