Here’s the updated `README.md` snippet including a collapsible section with a sample `terraform plan` output:

---

### 📘 Day 06: Virtual Networks with Multiple Subnets and VNet Peering (`for_each` based)

This mini-project demonstrates how to define and deploy multiple virtual networks, each with their own subnets and peering relationships, using `for_each` in Terraform.

---

### ✅ What’s Covered

* Use of `for_each` with nested objects
* Multiple virtual networks (`vnet-app`, `vnet-hub`)
* Multiple subnets inside one VNet (`front_end`, `back_end`)
* Default subnet usage in another VNet
* Planned VNet peering between the two

---

### 🛠️ Terraform Plan Output Only

At this stage, only `terraform plan` has been executed to validate the configuration. No actual infrastructure has been provisioned yet. The deployment is deferred to a later day where the same logic will be restructured using **Terraform modules**.

You can view the expected infrastructure changes by running:

```bash
terraform plan
```

<details>
<summary>Sample terraform plan output</summary>

```
Terraform will perform the following actions:

  # azurerm_virtual_network.vnets["vnet-app"] will be created
  + resource "azurerm_virtual_network" "vnets" {
      + name                = "vnet-app"
      + address_space                  = [
          + "10.1.0.0/16",
        ]
      + location            = "East US"
      + resource_group_name = "zenith-rg"
      ...
    }

  # azurerm_virtual_network.vnets["vnet-hub"] will be created
  + resource "azurerm_virtual_network" "vnets" {
      + name                = "vnet-hub"
      + address_space                  = [
          + "10.0.0.0/16",
        ]
      + location            = "East US"
      + resource_group_name = "zenith-rg"
      ...
    }

  # azurerm_subnet.subnets["vnet-app.front_end"] will be created
  + resource "azurerm_subnet" "subnets" {
      + name                 = "front_end"
      + address_prefixes                              = [
          + "10.1.0.0/24",
        ]
      + virtual_network_name = "vnet-app"
      ...
    }

  # azurerm_subnet.subnets["vnet-app.back_end"] will be created
  + resource "azurerm_subnet" "subnets" {
      + name                 = "back_end"
      + address_prefixes                              = [
          + "10.1.1.0/24",
        ]
      + virtual_network_name = "vnet-app"
      ...
    }

Plan: 4 to add, 0 to change, 0 to destroy.
```

</details>

---

### 📁 Folder Structure

```
day06/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

---

### ⏭️ Coming Up

In **Day 07**, the same architecture will be implemented using reusable **Terraform modules** for improved structure and maintainability. Deployment will take place at that stage.
