
variable "vnets" {
  description = "name of virtual network"
  type = list(object({
    name = string
    address_space = list(string)
    location = string
    resource_group = string
    subnets = list(object({
        name = string
        address_prefix = string
    }))
  }))
}

