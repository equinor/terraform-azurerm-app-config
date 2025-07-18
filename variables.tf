variable "store_name" {
  description = "The name of this App Configuration store."
  type        = string
  nullable    = false

  validation {
    condition     = length(var.store_name) >= 5 && length(var.store_name) <= 50
    error_message = "The name must be between 5 and 50 characters."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
  nullable    = false
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
  nullable    = false
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace to send diagnostics to."
  type        = string
  nullable    = false
}

variable "sku" {
  description = "The SKU of this App Configuration store. Value must be \"free\", \"developer\", \"standard\", or \"premium\"."
  type        = string
  default     = "standard"
  nullable    = false

  validation {
    condition     = contains(["free", "developer", "standard", "premium"], var.sku)
    error_message = "Sku must be \"free\", \"developer\", \"standard\", or \"premium\"."
  }
}

variable "local_auth_enabled" {
  description = "Is local authentication using access keys enabled for this App Configuration store?"
  type        = bool
  default     = false
  nullable    = false
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. Value must be between 1 and 7."
  type        = number
  default     = 7
  nullable    = false

  validation {
    condition     = var.soft_delete_retention_days >= 1 && var.soft_delete_retention_days <= 7
    error_message = "The soft delete retention days must be between 1 and 7."
  }
}

variable "purge_protection_enabled" {
  description = "Is purge protection enabled for this App Configuration store?"
  type        = bool
  default     = false
  nullable    = false
}

variable "system_assigned_identity_enabled" {
  description = "Should the system-assigned identity be enabled for this App Configuration store?"
  type        = bool
  default     = false
  nullable    = false
}

variable "identity_ids" {
  description = "A list of IDs of managed identities to be assigned to this App Configuration store."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "public_network_access" {
  description = "The public network access setting for this App Configuration store. Value must be \"Enabled\" or \"Disabled\"."
  type        = string
  default     = "Enabled"
  nullable    = false

  validation {
    condition     = contains(["Enabled", "Disabled"], var.public_network_access)
    error_message = "Public network access must be \"Enabled\" or \"Disabled\"."
  }
}

variable "diagnostic_setting_name" {
  description = "The name of this diagnostic setting."
  type        = string
  default     = "audit-logs"
  nullable    = false
}

variable "diagnostic_setting_enabled_log_categories" {
  description = "A list of log categories to be enabled for this diagnostic setting."
  type        = list(string)
  default     = ["Audit"]
  nullable    = false
}

variable "diagnostic_setting_enabled_metric_categories" {
  description = "A list of metric categories to be enabled for this diagnostic setting."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
  nullable    = false
}
