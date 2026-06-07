
output "rg_names" {
  value = {
    for k, rg in azurerm_resource_group.rg_name :
    k => rg.name
  }
}
