provider "azurerm" {
  features {
    app_configuration {
      purge_soft_delete_on_destroy = false
    }
  }
}

resource "random_id" "example" {
  byte_length = 8
}

resource "azurerm_resource_group" "this" {
  name = "rg-testing-sosj"
  location = "westeurope"
}

module "log_analytics" {
  source = "github.com/equinor/terraform-azurerm-log-analytics?ref=v1.5.0"

  workspace_name      = "log-${random_id.example.hex}"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
}

module "app_config" {
  # source = "github.com/equinor/terraform-azurerm-app-config"
  source = "../.."

  store_name                 = "appcs-${random_id.example.hex}"
  resource_group_name        = azurerm_resource_group.this.name
  location                   = var.location
  sku                        = "free"
  log_analytics_workspace_id = module.log_analytics.workspace_id
}
