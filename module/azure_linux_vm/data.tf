data "azurerm_network_interface" "nic" {
  for_each            = var.linux_vm
  name                = each.value.nic
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.linux_vm
  name                = each.value.kv_name
  resource_group_name = "pintu11"
}

data "azurerm_key_vault_secret" "username" {
  for_each     = var.linux_vm
  name         = "vm-username01"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each     = var.linux_vm
  name         = "vm-password01"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}