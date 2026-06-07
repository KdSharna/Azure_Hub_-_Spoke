resource "azurerm_virtual_network_gateway" "hub_vpn" {
  for_each = var.hub_vpn

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  type                = each.value.type
  vpn_type            = each.value.vpn_type
  active_active       = each.value.active_active
  enable_bgp          = each.value.enable_bgp
  sku                 = each.value.sku

  ip_configuration {
    name                          = "vnetGatewayConfig"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.hub_pip[each.key].id
    subnet_id                     = data.azurerm_subnet.gateway_subnet[each.key].id
    # public_ip_address_id = azurerm_public_ip.hub_pip.id
    # subnet_id            = azurerm_subnet.gateway_subnet.id
  }
}



