#!/bin/bash

# This script sets required environment variables for Terraform to authenticate with Azure

echo "Setting Azure Terraform environment variables..."

# Get current Azure subscription ID
SUBSCRIPTION_ID=$(az account show --query "id" -o tsv)

if [ -z "$SUBSCRIPTION_ID" ]; then
  echo "Failed to retrieve Azure subscription ID. Are you logged in? Use: az login"
  exit 1
fi

# Export environment variables
export ARM_SUBSCRIPTION_ID=$SUBSCRIPTION_ID
export ARM_CLIENT_ID=""
export ARM_CLIENT_SECRET=""
export ARM_TENANT_ID=$(az account show --query "tenantId" -o tsv)

# Optional: write to shell profile so it's permanent
read -p "Do you want to add ARM_SUBSCRIPTION_ID to your ~/.bashrc or ~/.zshrc for future use? (y/n): " answer
if [[ "$answer" == "y" ]]; then
  SHELL_RC="$HOME/.bashrc"
  [[ "$SHELL" =~ "zsh" ]] && SHELL_RC="$HOME/.zshrc"

  echo "export ARM_SUBSCRIPTION_ID=$SUBSCRIPTION_ID" >> "$SHELL_RC"
  echo "export ARM_TENANT_ID=$(az account show --query "tenantId" -o tsv)" >> "$SHELL_RC"

  echo "Environment variables added to $SHELL_RC"
  echo "Run: source $SHELL_RC to apply it now"
else
  echo "Variables set only for this session"
fi
