# 📘 Day 07 - Refactor into Modules: VNet & Subnet as Reusable Units

📁 Folder: `day07-vnet-modules`

## 🔍 What I Did
- Created a reusable `vnet` module to provision Virtual Networks and Subnets.
- Moved the logic from Day 06 into this module, using input variables for flexibility.
- Updated the root `main.tf` to consume the module for multiple VNets.
- Added support for nested subnets and tested with dynamic `for_each`.

## 📌 Highlights
- Used `for_each` within modules to iterate over subnet lists.
- Decoupled VNet logic from main configuration for better structure.
- Simplified root `main.tf` by leveraging module inputs.

## 🧠 Learnings
- Structure and syntax of a basic Terraform module.
- Passing complex objects (like a list of subnet maps) into modules.
- Reusability benefits when scaling Terraform projects.

## 🛠 Structure Overview
```shell
day07-refactor-modules/
│
├── main.tf                # Calls the module for multiple VNets
├── variables.tf
├── terraform.tfvars
│
└── modules/
    └── vnet/
        ├── main.tf        # VNet + Subnet logic
        ├── variables.tf
        


