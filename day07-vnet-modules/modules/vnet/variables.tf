variable "vnet_name" {
  type = string
  description = "Name of virtual network"
}
variable "address_space" {
  type = list(string)
  description = "Address space for the VNET"
}
variable "subnets" {
  description = "Subnet list"
  type = list(object({
    name = string
    address_prefix = string
  }))
}
variable "resource_group" {
  type = string
}
variable "location" {
  type = string
}