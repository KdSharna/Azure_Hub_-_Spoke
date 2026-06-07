data "azurerm_subnet" "firewall_subnet" {
  for_each             = var.lb_firewall
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "firewall_pip" {
  for_each = var.lb_firewall

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name

}
