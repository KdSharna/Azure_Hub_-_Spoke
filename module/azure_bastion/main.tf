resource "azurerm_bastion_host" "bastion_login" {
  for_each            = var.bastion_login
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = "bastion-ipconfig"
    subnet_id            = data.azurerm_subnet.bastion_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id

  }
}


