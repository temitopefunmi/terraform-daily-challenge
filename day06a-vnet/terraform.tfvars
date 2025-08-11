vnets = {
  "vnet-app" = {
    address_space = ["10.1.0.0/16"]
    subnets = {
        frontend = "10.1.0.0/24"
        backend = "10.1.1.0/24" 
    }
  }
  "vnet-hub" ={
    address_space = ["10.0.0.0/16"]
    subnets = {
        default ="10.0.1.0/24"
    }

  }

}