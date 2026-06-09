module "name_rg" {
  source = "../../module/azure_resource_group"

  rg_name = var.name_rg
}

module "pip_engress" {
  source     = "../../module/azure_public_ip"
  depends_on = [module.name_rg]

  engress_pip = var.pip_engress
}

module "name_nic" {
  source     = "../../module/azure_nic"
  depends_on = [module.name_rg, module.nw_virtual, module.pip_engress]

  nic_name = var.name_nic
}

module "nw_virtual" {
  source     = "../../module/azure_network"
  depends_on = [module.name_rg]

  virtual_nw = var.nw_virtual
}

module "vm_linux" {
  source     = "../../module/azure_linux_vm"
  depends_on = [module.name_rg, module.name_nic, module.nw_virtual, module.pip_engress]

  linux_vm = var.vm_linux
}

module "serversql" {
  source     = "../../module/azure_sql_server"
  depends_on = [module.name_rg]

  sqlserver = var.serversql
}

module "databasesql" {
  source     = "../../module/azure_sql_database"
  depends_on = [module.serversql]

  sqldatabase = var.databasesql
}

module "login_bastion" {
  source = "../../module/azure_bastion"

  depends_on    = [module.name_rg, module.nw_virtual, module.pip_engress]
  bastion_login = var.login_bastion
}

module "nsg_my" {
  source     = "../../module/azure_nsg"
  depends_on = [module.name_rg, module.nw_virtual]

  my_nsg = var.nsg_my
}

# module "lb_main" {
#   source     = "../../module/azure_lb"
#   depends_on = [module.name_rg, module.pip_engress]

#   main_lb = var.lb_main
# }

# module "rules_lb" {
#   source     = "../../module/azure_lb_rules"
#   depends_on = [module.lb_main]

#   lb_rules = var.rules_lb
#   lb_id    = module.lb_main.lb_ids["lb_main1"]
# }

# module "probe_lb" {
#   source     = "../../module/azurerm_lb_probe"
#   depends_on = [module.lb_main]

#   lb_probe = var.probe_lb
#   lb_id    = module.lb_main.lb_ids["lb_main1"]
# }

# module "pool_back" {
#   source     = "../../module/azurerm_lb_backend_pool"
#   depends_on = [module.lb_main, module.probe_lb]

#   back_pool = var.pool_back
#   lb_id     = module.lb_main.lb_ids["lb_main1"]
# }

# module "pool_nat" {
#   source     = "../../module/azurerm_lb_nat_pool"
#   depends_on = [module.lb_main, module.pool_back]

#   nat_pool = var.pool_nat
#   lb_id    = module.lb_main.lb_ids["lb_main1"]
# }

# resource "azurerm_network_interface_backend_address_pool_association" "fe_nic_lb" {
#   network_interface_id    = module.name_nic.nic_ids["nic1"]
#   ip_configuration_name   = "internal" # <- correct
#   backend_address_pool_id = module.pool_back.back_pool_ids["pool_back1"]

#   depends_on = [module.name_nic, module.pool_back]
# }

# resource "azurerm_network_interface_backend_address_pool_association" "be_nic_lb" {
#   network_interface_id    = module.name_nic.nic_ids["nic2"]
#   ip_configuration_name   = "internal" # <- correct
#   backend_address_pool_id = module.pool_back.back_pool_ids["pool_back1"]

#   depends_on = [module.name_nic, module.pool_back]
# }

module "firewall_lb" {
  source     = "../../module/azure_firewall"
  depends_on = [module.name_rg, module.nw_virtual]

  lb_firewall = var.firewall_lb
  # subnet_id   = module.nw_virtual.subnet_ids["AzureFirewallSubnet"]

}

# module "vault_keys" {
#   source     = "../../module/azure_key_vault"
#   depends_on = [module.name_rg]

#   keys_vault = var.vault_keys
# }

module "gw_nat" {
  source     = "../../module/azure_nat_gateway"
  depends_on = [module.name_rg]

  nat_gw = var.gw_nat
}

# resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assoc" {
#   nat_gateway_id       = module.gw_nat.nat_gateway_ids["nat1"]
#   public_ip_address_id = module.pip_engress.pip_ids["pip3"]

#   depends_on = [module.gw_nat, module.pip_engress]
# }

# resource "azurerm_subnet_nat_gateway_association" "fe_nat_assoc" {
#   subnet_id      = module.nw_virtual.subnet_ids["fe_subnet"]
#   nat_gateway_id = module.gw_nat.nat_gateway_ids["nat1"]

#   depends_on = [module.nw_virtual, module.gw_nat]
# }

# resource "azurerm_subnet_nat_gateway_association" "be_nat_assoc" {
#   subnet_id      = module.nw_virtual.subnet_ids["be_subnet"]
#   nat_gateway_id = module.gw_nat.nat_gateway_ids["nat1"]

#   depends_on = [module.nw_virtual, module.gw_nat]
# }

module "peering_vnet" {
  source     = "../../module/azure_hub_spoke_peering"
  depends_on = [module.name_rg, module.vpn_hub]

  vnet_peering = var.peering_vnet
}

module "vpn_hub" {
  source     = "../../module/azure_vpn_gw"
  depends_on = [module.name_rg, module.nw_virtual, module.pip_engress]

  hub_vpn = var.vpn_hub
}

module "rt_spoke" {
  source     = "../../module/azure_route_table"
  depends_on = [module.name_rg]
  spoke_rt   = var.rt_spoke
}

module "r_spoke" {
  source     = "../../module/azure_route"
  depends_on = [module.name_rg, module.rt_spoke]

  spoke_r = var.r_spoke
}

# module "assoc_subnet_rt" {
#   source = "../../module/azurerm_subnet_route_table_ass"
# depends_on = [module.name_rg, module.rt_spoke, module.nw_virtual]

# subnet_rt_assoc = local.assoc_subnet_rt
# }

module "lan_hub_gw" {
  source     = "../../module/azure_local_nw_gw"
  depends_on = [module.name_rg, module.pip_engress, module.nw_virtual]

  hub_lan_gw = var.lan_hub_gw
}
