variable "resource_group_name" {
  description = "Name of resource group"
  type = string
}

variable "location" {
  description = "Azure Region"
  type = string
  default = "East US"
}