
data "azurerm_mssql_server" "sqldata" {
  for_each = var.sqldatabase
  name                = each.value.sql_name
  resource_group_name = each.value.rg_name
}