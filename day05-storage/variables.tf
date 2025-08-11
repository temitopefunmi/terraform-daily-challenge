variable "resource_group_name" {
  description = "Resource group where the storage account exists"
  type = string
}

variable "location" {
  description = "Azure region"
  type = string
}

variable "existing_storage" {
  description = "Name of the existing storage account to use"
  type = string
}