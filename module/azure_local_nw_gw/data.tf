data "azurerm_public_ip" "onprem_pip" {
  for_each = var.hub_lan_gw

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
