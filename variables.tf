variable "store_name" {
  description = "The name of this App Configuration store."
}

variable "resource_group_name" {
  description = "The name of the resource group to create the resources in."
  type        = string
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace to send diagnostics to."
  type        = string
}

variable "sku" {
  description = "The SKU of this App Configuration store."
  type        = string
  default     = "standard"
}

variable "local_auth_enabled" {
  description = "Is local authentication using access keys enabled for this App Configuration store?"
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted"
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Is purge protection enabled for this App Configuration store?"
  type        = bool
  default     = false
}

variable "public_network_access" {
  description = "The public network access setting for this App Configuration store."
  type        = string
  default     = "Enabled"
}

variable "diagnostic_setting_name" {
  description = "The name of this diagnostic setting."
  type        = string
  default     = "audit-logs"
}

variable "diagnostic_setting_enabled_log_categories" {
  description = "A list of log categories to be enabled for this diagnostic setting."
  type        = list(string)
  default     = ["Audit"]
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
