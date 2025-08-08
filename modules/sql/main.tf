resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sqlserver-${var.name}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  public_network_access_enabled = true
}

resource "azurerm_mssql_database" "sqldb" {
  name       = "${var.sqldb_name}-db"
  server_id  = azurerm_mssql_server.sqlserver.id
  sku_name   = var.sql_sku_name
  max_size_gb = var.max_size_gb
  zone_redundant = var.zone_redundant
  read_scale     = var.read_scale
}


