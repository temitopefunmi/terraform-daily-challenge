# Day 3 - Parameterizing Resource Group Deployment

In this mini project, we refactored the Day 2 hardcoded resource group deployment to use variables. This makes the configuration reusable and easier to manage.

## Files
- `main.tf`: Main configuration for the resource group.
- `variables.tf`: Declares variables used in the project.
- `terraform.tfvars`: Supplies values for the variables.

## To Run
```bash
# Run terraform destroy in Day02 folder to delete the previous resource group if you want
terraform init
terraform plan
terraform apply
