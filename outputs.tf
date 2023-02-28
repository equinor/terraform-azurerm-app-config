output "store_name" {
  description = "The name of this App Configuration store."
  value       = azurerm_app_configuration.this.name
}

output "store_id" {
  description = "The ID of this App Configuration store."
  value       = azurerm_app_configuration.this.id
}

output "endpoint" {
  description = "The endpoint of this App Configuration store."
  value       = azurerm_app_configuration.this.endpoint
}

output "primary_read_key" {
  description = "The primary read key of this App Configuration store."
  value       = azurerm_app_configuration.this.primary_read_key
}

output "primary_write_key" {
  description = "The primary write key of this App Configuration store."
  value       = azurerm_app_configuration.this.primary_write_key
}

output "secondary_read_key" {
  description = "The secondary read key of this App Configuration store."
  value       = azurerm_app_configuration.this.secondary_read_key
}

output "secondary_write_key" {
  description = "The secondary write key of this App Configuration store."
  value       = azurerm_app_configuration.this.secondary_write_key
}

output "indetity_principal_id" {
  description = "The principal ID of the system-assigned identity of this App Configuration store."
  value       = try(azurerm_app_configuration.this.identity[0].principal_id, null)
}

output "identity_tenant_id" {
  description = "The tenant ID of the system-assigned identity of this App Configuration store."
  value       = try(azurerm_app_configuration.this.identity[0].tenant_id, null)
}
