provider "azurerm" {
  features {}
}

locals {
  tags = {
    "environment" = "testing"
  }
}

resource "random_id" "example" {
  byte_length = 8
}

resource "azurerm_resource_group" "example" {
  name     = "rg-${random_id.example.hex}"
  location = var.location

  tags = local.tags
}

module "log_analytics" {
  source = "github.com/equinor/terraform-azurerm-log-analytics?ref=v1.3.1"

  workspace_name      = "log-${random_id.example.hex}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  tags = local.tags
}

module "app_config" {
  # source = "github.com/equinor/terraform-azurerm-app-config"
  source = "../.."

  store_name                                = "appcs-${random_id.example.hex}"
  resource_group_name                       = azurerm_resource_group.example.name
  location                                  = azurerm_resource_group.example.location
  log_analytics_workspace_id                = module.log_analytics.workspace_id
  sku                                       = "standard"
  local_auth_enabled                        = false
  soft_delete_retention_days                = 7
  purge_protection_enabled                  = false
  public_network_access                     = "Enabled"
  diagnostic_setting_name                   = "audit-logs"
  diagnostic_setting_enabled_log_categories = ["Audit"]
  tags                                      = local.tags
}
