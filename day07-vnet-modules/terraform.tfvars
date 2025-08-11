resource_group = "zenith-rg"
location = "East US"

vnets = [ 
    {
  name = "vnet-app"
  address_space = [ "10.1.0.0/16" ]
  subnets = [ 
    { name = "front_end", address_prefix = "10.1.0.0/24" },
    { name = "back_end", address_prefix = "10.1.1.0/24" }
   ]
   },
   {
    name = "vnet-hub"
    address_space = [ "10.0.0.0/16" ]
    subnets = [ {
      name = "default" , address_prefix = "10.0.0.0/24"}
    ]
   }
]