variable "resource_group" {
  type = string
  description = "Name of resource group"  
}

variable "location" {
  type = string
  description = "Azure Region"
}

variable "vnets" {
  type = list(object({
    name = string
    address_space = list(string)
    subnets = list(object({
        name = string
        address_prefix = string
    })) 
  }))
}