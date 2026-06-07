resource "azurerm_route_table" "spoke_rt" {
  for_each = var.spoke_rt

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

