resource "azurerm_local_network_gateway" "hub_lan_gw" {
  for_each = var.hub_lan_gw

  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  address_space       = each.value.address_space
  gateway_address     = data.azurerm_public_ip.onprem_pip[each.key].ip_address
  # gateway_address = azurerm_public_ip.onprem_pip.ip_address
}
