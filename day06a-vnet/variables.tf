variable "vnets" {
    description = "A map of virtual networks and their subnets"
    type = map(object({
        address_space = list(string)
        subnets = map(string) #subnet_name => subnet_cidr
            }
        )
    )  
}