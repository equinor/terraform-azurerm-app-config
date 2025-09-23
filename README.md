# Terraform module for Azure App Configuration

[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-app-config)](https://github.com/equinor/terraform-azurerm-app-config/releases/latest)
[![Terraform Module Downloads](https://img.shields.io/terraform/module/dt/equinor/app-config/azurerm)](https://registry.terraform.io/modules/equinor/app-config/azurerm/latest)
[![GitHub contributors](https://img.shields.io/github/contributors/equinor/terraform-azurerm-app-config)](https://github.com/equinor/terraform-azurerm-app-config/graphs/contributors)
[![GitHub Issues](https://img.shields.io/github/issues/equinor/terraform-azurerm-app-config)](https://github.com/equinor/terraform-azurerm-app-config/issues)
[![GitHub Pull requests](https://img.shields.io/github/issues-pr/equinor/terraform-azurerm-app-config)](https://github.com/equinor/terraform-azurerm-app-config/pulls)
[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-app-config)](https://github.com/equinor/terraform-azurerm-app-config/blob/main/LICENSE)

Terraform module which creates Azure App Configuration resources.

## Features

- Microsoft Entra authorization enforced by default.
- Audit logs sent to given Log Analytics workspace by default.

## Prerequisites

- Azure role `Contributor` at the resource group scope.
- Azure role `Log Analytics Contributor` at the Log Analytics workspace scope.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "app_config" {
  source  = "equinor/app-config/azurerm"
  version = "~> 1.5"

  store_name                 = "example-store"
  resource_group_name        = azurerm_resource_group.example.name
  location                   = azurerm_resource_group.example.location
  log_analytics_workspace_id = module.log_analytics.workspace_id
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}

module "log_analytics" {
  source  = "equinor/log-analytics/azurerm"
  version = "~> 2.0"

  workspace_name      = "example-workspace"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
