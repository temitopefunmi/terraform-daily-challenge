# 🌱 Terraform Daily Challenge – 28 Days of Infrastructure as Code

Welcome to my personal **Terraform learning journey**! This repo documents a **28-day challenge** to build hands-on experience with Terraform by doing small, practical projects every day. The focus is on **Azure**, but most concepts apply across all cloud platforms.

Each folder (`dayXX-*`) contains:
- Terraform configuration files
- A dedicated `README.md` describing what I did that day
- My reflections, troubleshooting notes, and useful commands

## 🌐 Quick Azure Setup for Terraform

Before using the Terraform projects in this repo, run the environment setup script:

```bash
bash setup-env.sh

---

## 📅 Daily Task Table

| Day | Topic | Folder |
|-----|-------|--------|
| 01  | Install Terraform CLI & set up environment | [day01-installation](./day01-installation) |
| 02  | Providers, Variables & Your First Resource | [day02-providers-variables](./day02-providers-variables) |
| 03  | Parameterizing Resource Group Deployment with Variables | [day03-variable-refactor](./day03-variable-refactor) |
| 04  | Add Azure Storage Account | [day04-storage-account](./day04-storage-account) |
| 05  | Manage Storage Containers & Blobs | [day05-storage](./day05-storage) |
| 06  | Deploy Azure Virtual Networks (VNets) & Subnets using `for_each` | [day06-vnet-foreach](./day06-vnet-foreach) |
| 07  | Refactor VNet Deployment into Modules | [day07-vnet-modules](./day07-vnet-modules) |
| 08  | Add Network Security Groups (NSGs) & Azure Firewall with Toggle Variables | [day08-security](./day08-security) |
| 09  | Static Public IP & Network Interface (NIC) | [day09-networking](./day09-networking) |
| 10  | Deploy a Linux Virtual Machine | [day10-linux-vm](./day10-linux-vm) |
| 11  | Deploy a Windows Virtual Machine | [day11-windows-vm](./day11-windows-vm) |
| 12  | Use Output Values for VM Connection Details | [day12-outputs](./day12-outputs) |
| 13  | Provision a Simple Web App on Azure App Service | [day13-webapp](./day13-webapp) |
| 14  | Connect Web App to Storage via App Settings | [day14-appconfig](./day14-appconfig) |
| 15  | Use Locals, Functions & Expressions | [day15-locals](./day15-locals) |
| 16  | Remote State with Azure Storage | [day16-remote-state](./day16-remote-state) |
| 17  | Lint & Test Terraform Code with Checkov | [day17-checkov](./day17-checkov) |
| 18  | Deploy with GitHub Actions (CI/CD) | [day18-github-actions](./day18-github-actions) |
| 19  | Adding Tags & Organizing Resources | [day19-tags](./day19-tags) |
| 20  | Terraform Data Sources | [day20-data-sources](./day20-data-sources) |
| 21  | Conditional Deployments with `count` & `for_each` | [day21-conditionals](./day21-conditionals) |
| 22  | Terraform Import (Adopting Existing Azure Resources) | [day22-import](./day22-import) |
| 23  | Advanced Modules: Reusable Infra Patterns | [day23-advanced-modules](./day23-advanced-modules) |
| 24  | Policy as Code: Azure Policy & Terraform | [day24-policy](./day24-policy) |
| 25  | Monitoring & Alerts with Terraform | [day25-monitoring](./day25-monitoring) |
| 26  | Scaling Infrastructure with Terraform | [day26-scaling](./day26-scaling) |
| 27  | Team-Ready Infra: Remote State + Modules | *(coming soon)* |
| 28  | Final Review & Clean-up | *(coming soon)* |


## 🔗 Resources
- [Terraform Official Docs](https://developer.hashicorp.com/terraform)
- [Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

---

📌 _Follow along or fork this repo to start your own challenge!_
