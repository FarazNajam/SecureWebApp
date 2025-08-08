output "sql_server_fqdn" {
  value = azurerm_mssql_server.sqlserver.fqdn
}

output "sql_database_name" {
  value = azurerm_mssql_database.sqldb.name
}

output "sql_server_name" {
  value = azurerm_mssql_server.sqlserver.name
}
