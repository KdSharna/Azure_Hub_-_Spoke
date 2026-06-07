data "azurerm_subnet" "bastion_subnet" {
  for_each             = var.bastion_login
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.bastion_login
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
