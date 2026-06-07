data "azurerm_subnet" "gateway_subnet" {
  for_each             = var.hub_vpn
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "hub_pip" {
  for_each            = var.hub_vpn
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}