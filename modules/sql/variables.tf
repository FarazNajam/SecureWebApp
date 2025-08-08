variable "sqlserver_name" {
  description = "Prefix for naming"
  type        = string
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sqldb_name" {
  description = "SQL database name"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL Server admin username"
  type        = string
  default     = "sqladminuser"
}

variable "sql_admin_password" {
  description = "SQL Server admin password"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "SQL Database SKU (pricing tier)"
  type        = string
  default     = "S0"
}

variable "max_size_gb" {
  description = "Max size of the database in GB"
  type        = number
  default     = 10
}

variable "zone_redundant" {
  description = "Enable zone redundancy for database"
  type        = bool
  default     = false
}

variable "read_scale" {
  description = "Enable read scale"
  type        = string
  default     = "Disabled"
}
