name_rg = {
  rg1 = {
    name       = "rg-hub"
    location   = "west us"
    managed_by = "Terraform"
  }

  rg2 = {
    name       = "rg-spoke1"
    location   = "Australia East"
    managed_by = "Terraform"
  }
  rg3 = {
    name       = "rg-spoke2"
    location   = "West Europe"
    managed_by = "Terraform"
  }
  rg4 = {
    name       = "rg-data-sql"
    location   = "west us 2"
    managed_by = "Terraform"
  }
  rg5 = {
    name       = "rg-onprem"
    location   = "Australia East"
    managed_by = "Terraform"
  }
}

pip_engress = {
  pip1 = {
    name                = "hub_pip"
    resource_group_name = "rg-hub"
    location            = "west us"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip5 = {
    name                = "hub_pip2"
    resource_group_name = "rg-hub"
    location            = "west us"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip6 = {
    name                = "hub_pip3"
    resource_group_name = "rg-hub"
    location            = "west us"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip2 = {
    name                = "spoke1_pip"
    resource_group_name = "rg-spoke1"
    location            = "Australia East"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip3 = {
    name                = "spoke2_pip"
    resource_group_name = "rg-spoke2"
    location            = "West Europe"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip4 = {
    name                = "on_prem_pip"
    resource_group_name = "rg-hub"
    location            = "Australia East"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

name_nic = {
  nic1 = {
    name        = "hub_nic"
    rg_name     = "rg-hub"
    location    = "west us"
    subnet_name = "MgmtSubnet"
    vnet_name   = "vnet-prod-hub-wu2"
    # pip_name    = "fe_pip"
    # ip_forward = true
  }
  nic2 = {
    name        = "spoke1_nic"
    rg_name     = "rg-spoke1"
    location    = "Australia East"
    subnet_name = "AppSubnet"
    vnet_name   = "vnet-prod-spoke1-eus"
    # pip_name    = "be_pip"
    # ip_forward = false
  }
  nic3 = {
    name        = "spoke2_nic"
    rg_name     = "rg-spoke2"
    location    = "West Europe"
    subnet_name = "AppSubnet"
    vnet_name   = "vnet-prod-spoke2-weu"
    #   pip_name    = "be_pip"
    # ip_forward = false
  }
  nic4 = {
    name        = "onprem_nic"
    rg_name     = "rg-onprem"
    location    = "Australia East"
    subnet_name = "AppSubnet"
    vnet_name   = "vnet-onprem"
    #   pip_name    = "be_pip"
    # ip_forward = false
  }
}

nw_virtual = {
  vnet1 = {
    name                = "vnet-prod-hub-wu2"
    resource_group_name = "rg-hub"
    location            = "west us"
    address_space       = ["10.1.0.0/16"]
    dns_servers         = ["8.8.8.8", "8.8.4.4"]

    subnet = [
      {
        name             = "MgmtSubnet"
        address_prefixes = ["10.1.1.0/24"]
      },
      {
        name             = "SharedServices"
        address_prefixes = ["10.1.2.0/24"]
      },
      {
        name             = "AzureFirewallSubnet"
        address_prefixes = ["10.1.10.0/26"]
      },
      {
        name             = "GatewaySubnet"
        address_prefixes = ["10.1.255.0/27"]
      },
      {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.1.4.0/26"]
      }

    ]
  }

  vnet2 = {
    name                = "vnet-prod-spoke1-eus"
    resource_group_name = "rg-spoke1"
    location            = "Australia East"
    address_space       = ["10.2.0.0/16"]
    dns_servers         = ["8.8.8.8", "8.8.4.4"]

    subnet = [
      {
        name             = "AppSubnet"
        address_prefixes = ["10.2.1.0/24"]
      },
      {
        name             = "DbSubnet"
        address_prefixes = ["10.2.2.0/24"]
      },
      {
        name             = "PrivateEndpointSubnet"
        address_prefixes = ["10.2.3.0/24"]
      }
    ]
  }

  vnet3 = {
    name                = "vnet-prod-spoke2-weu"
    resource_group_name = "rg-spoke2"
    location            = "West Europe"
    address_space       = ["10.3.0.0/16"]
    dns_servers         = ["8.8.8.8", "8.8.4.4"]

    subnet = [
      {
        name             = "AppSubnet"
        address_prefixes = ["10.3.1.0/24"]
      },
      {
        name             = "DbSubnet"
        address_prefixes = ["10.3.2.0/24"]
      },
      {
        name             = "PrivateEndpointSubnet"
        address_prefixes = ["10.3.3.0/24"]
      }
    ]
  }

  vnet4 = {
    name                = "vnet-onprem"
    resource_group_name = "rg-onprem"
    location            = "Australia East"
    address_space       = ["10.4.0.0/16"]
    dns_servers         = ["8.8.8.8", "8.8.4.4"]
    subnet = [
      {
        name             = "AppSubnet"
        address_prefixes = ["10.4.1.0/24"]
      }
    ]
  }
}

vm_linux = {
  vm1 = {
    name           = "hub1-vm"
    computer_name  = "hubvm1"
    rg_name        = "rg-hub"
    location       = "west us"
    size           = "Standard_D2s_v3"
    nic            = "hub_nic"
    kv_name        = "my-secrete00"
    admin_username = "vm-username01"
    admin_password = "vm-password01"
    vnet_name      = "vnet-prod-hub-wu2"
    subnet_name    = "MgmtSubnet"
    # script_name    = "nginx.yaml"
    script_name = "hub-router.yaml" # 👈 ONLY HUB
    source_image_reference = {
      image1 = {
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        publisher = "Canonical"
        version   = "latest"
      }
    }
  }
  vm2 = {
    name           = "spoke1-vm"
    computer_name  = "spokevm1"
    rg_name        = "rg-spoke1"
    location       = "Australia East"
    size           = "Standard_D2s_v3"
    nic            = "spoke1_nic"
    kv_name        = "my-secrete00"
    admin_username = "vm-username01"
    admin_password = "vm-password01"
    vnet_name      = "vnet-prod-spoke1-eus"
    subnet_name    = "AppSubnet"
    script_name    = "python.yaml"
    script_name    = null

    source_image_reference = {
      image1 = {
        publisher = "Canonical"
        version   = "latest"
        sku       = "22_04-lts"
        offer     = "0001-com-ubuntu-server-jammy"
      }
    }
  }
  vm3 = {
    name           = "spoke2-vm"
    computer_name  = "spokevm2"
    rg_name        = "rg-spoke2"
    location       = "West Europe"
    size           = "Standard_D2s_v3"
    nic            = "spoke2_nic"
    kv_name        = "my-secrete00"
    admin_username = "vm-username01"
    admin_password = "vm-password01"
    vnet_name      = "vnet-prod-spoke2-weu"
    subnet_name    = "AppSubnet"
    # script_name    = "python.yaml"
    script_name = null

    source_image_reference = {
      image1 = {
        publisher = "Canonical"
        version   = "latest"
        sku       = "22_04-lts"
        offer     = "0001-com-ubuntu-server-jammy"
      }
    }
  }
  vm4 = {
    name           = "onprem-vm"
    computer_name  = "onpremvm2"
    rg_name        = "rg-onprem"
    location       = "Australia East"
    size           = "Standard_D2s_v3"
    nic            = "onprem_nic"
    kv_name        = "my-secrete00"
    admin_username = "vm-username01"
    admin_password = "vm-password01"
    vnet_name      = "vnet-onprem"
    subnet_name    = "AppSubnet"
    # script_name    = "python.yaml"

    source_image_reference = {
      image1 = {
        publisher = "Canonical"
        version   = "latest"
        sku       = "22_04-lts"
        offer     = "0001-com-ubuntu-server-jammy"
      }
    }
  }
}

serversql = {
  server1 = {
    name                         = "mysqlservertittu1230"
    resource_group_name          = "rg-onprem"
    location                     = "Australia East"
    version                      = "12.0"
    administrator_login          = "Tattu01!@"
    administrator_login_password = "Tattu!12345"
    minimum_tls_version          = "1.2"
  }
}

databasesql = {
  database1 = {
    name         = "mysqldatabase"
    sql_name     = "mysqlservertittu1230"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    rg_name      = "rg-onprem"
  }
}

login_bastion = {
  bastion1 = {
    name        = "spoke1_bastion"
    location    = "west us"
    rg_name     = "rg-hub"
    subnet_name = "AzureBastionSubnet"
    vnet_name   = "vnet-prod-hub-wu2"
    pip_name    = "hub_pip"
  }
}


nsg_my = {
  fe_nsg = {
    nsg_name = "onprem_nsg"
    location = "Australia East"
    rg_name  = "rg-onprem"
    security_rule = [
      {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-http"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }

  # be_nsg = {
  #   nsg_name = "be_nsg"
  #   location = "west us2"
  #   rg_name  = "tittu11"
  #   security_rule = [
  #     {
  #       name                       = "allow-ssh"
  #       priority                   = 100
  #       direction                  = "Inbound"
  #       access                     = "Allow"
  #       protocol                   = "Tcp"
  #       source_port_range          = "*"
  #       destination_port_range     = "22"
  #       source_address_prefix      = "*"
  #       destination_address_prefix = "*"
  #     },
  #     {
  #         name                       = "allow-http"
  #         priority                   = 110
  #         direction                  = "Inbound"
  #         access                     = "Allow"
  #         protocol                   = "Tcp"
  #         source_port_range          = "*"
  #         destination_port_range     = "80"
  #         source_address_prefix      = "*"
  #         destination_address_prefix = "*"
  #       }
  #     ]
  #   }
}


# nsg_subnet_associate = {
#   fe_nsg = ["fe_subnet"]
#   be_nsg = ["be_subnet"]
# }

# lb_main = {
#   lb_main1 = {
#     name     = "my_lb_main"
#     location = "west us2"
#     rg_name  = "tittu11"
#     pip_name = "main_pip"
#     frontend_ip_configuration = {
#       fe1 = {
#         name = "PublicFrontEnd"
#       }
#     }
#   }
# }

# rules_lb = {
#   rules_lb1 = {
#     name                           = "my_lb_rules"
#     protocol                       = "Tcp"
#     frontend_port                  = 80
#     backend_port                   = 80
#     frontend_ip_configuration_name = "PublicFrontEnd"
## loadbalancer_id                = var.lb_id
#   }
# }

# probe_lb = {
#   probe_lb1 = {
#     name = "my_probe_lb"
#     port = 80
## loadbalancer_id = azurerm_lb.lb.id
#   }
# }

# pool_back = {
#   pool_back1 = {
#     name = "my_pool_back"
#     # loadbalancer_id = azurerm_lb.lb.id
#   }
# }

# pool_nat = {
#   pool_nat1 = {
#     name                           = "my_pool_nat"
#     protocol                       = "Tcp"
#     frontend_port_start            = 8000
#     frontend_port_end              = 8080
#     backend_port                   = 22
#     frontend_ip_configuration_name = "PublicFrontEnd"
#     rg_name                        = "tittu11"
#     # loadbalancer_id                = azurerm_lb.lb.id
#   }
# }

firewall_lb = {
  fw1 = {
    name     = "my_firewall"
    location = "west us"
    rg_name  = "rg-hub"
    sku_name = "AZFW_VNet"
    sku_tier = "Standard"
    # subnet_id = "AzureFirewallSubnet"
    subnet_name = "AzureFirewallSubnet"
    vnet_name   = "vnet-prod-hub-wu2"
    pip_name    = "hub_pip3"
  }
}

# vault_keys = {
#   keys1 = {
#     name                = "my-secret-key123"
#     location            = "west us2"
#     resource_group_name = "tittu11"
#     sku_name            = "standard"

#   }
# }

gw_nat = {
  nat1 = {
    name                    = "nat-gateway"
    location                = "West Europe"
    resource_group_name     = "rg-spoke2"
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
    zones                   = ["1"]
  }
}

peering_vnet = {
  hub_to_spoke1 = {
    name                      = "hub-to-spoke1"
    resource_group_name       = "rg-hub"
    virtual_network_name      = "vnet-prod-hub-wu2"
    remote_virtual_network_id = "/subscriptions/69ba3bc7-f967-4749-bbe8-54cb06e4a54a/resourceGroups/rg-spoke1/providers/Microsoft.Network/virtualNetworks/vnet-prod-spoke1-eus"
    allow_gateway_transit     = true
    use_remote_gateways       = false
  }

  spoke1_to_hub = {
    name                      = "spoke1-to-hub"
    resource_group_name       = "rg-spoke1"
    virtual_network_name      = "vnet-prod-spoke1-eus"
    remote_virtual_network_id = "/subscriptions/69ba3bc7-f967-4749-bbe8-54cb06e4a54a/resourceGroups/rg-hub/providers/Microsoft.Network/virtualNetworks/vnet-prod-hub-wu2"
    allow_gateway_transit     = false
    use_remote_gateways       = true
  }

  hub_to_spoke2 = {
    name                      = "hub-to-spoke2"
    resource_group_name       = "rg-hub"
    virtual_network_name      = "vnet-prod-hub-wu2"
    remote_virtual_network_id = "/subscriptions/69ba3bc7-f967-4749-bbe8-54cb06e4a54a/resourceGroups/rg-spoke2/providers/Microsoft.Network/virtualNetworks/vnet-prod-spoke2-weu"
    allow_gateway_transit     = true
    use_remote_gateways       = false
  }

  spoke2_to_hub = {
    name                      = "spoke2-to-hub"
    resource_group_name       = "rg-spoke2"
    virtual_network_name      = "vnet-prod-spoke2-weu"
    remote_virtual_network_id = "/subscriptions/69ba3bc7-f967-4749-bbe8-54cb06e4a54a/resourceGroups/rg-hub/providers/Microsoft.Network/virtualNetworks/vnet-prod-hub-wu2"
    allow_gateway_transit     = false
    use_remote_gateways       = true
  }
}

vpn_hub = {
  vpn1 = {
    name          = "hub_spoke_vpn"
    location      = "west us"
    type          = "Vpn"
    vpn_type      = "RouteBased"
    active_active = false
    enable_bgp    = false
    sku           = "VpnGw1AZ"
    subnet_name   = "GatewaySubnet"
    vnet_name     = "vnet-prod-hub-wu2"
    pip_name      = "hub_pip2"
    rg_name       = "rg-hub"
  }
}

rt_spoke = {
  spoke1_rt = {
    name                = "rt-spoke1"
    location            = "Australia East"
    resource_group_name = "rg-spoke1"
  }
  spoke2_rt = {
    name                = "rt-spoke2"
    location            = "West Europe"
    resource_group_name = "rg-spoke2"
  }
}

r_spoke = {
  spoke1_to_spoke2 = {
    name                   = "to-spoke2"
    resource_group_name    = "rg-spoke1"
    route_table_name       = "rt-spoke1"
    address_prefix         = "10.3.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.1.1.4"
  }
  spoke2_to_spoke1 = {
    name                   = "to-spoke1"
    resource_group_name    = "rg-spoke2"
    route_table_name       = "rt-spoke2"
    address_prefix         = "10.2.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.1.1.4"
  }
}

# assoc_subnet_rt = {
#   spoke1 = {
# subnet_id      = "/subscriptions/05fdc691-9f29-4931-b03c-5e0d065dc0b6/resourceGroups/rg-spoke1/virtualNetworks/vnet-prod-spoke1-eus/subnets/AppSubnet"
# route_table_id = "/subscriptions/05fdc691-9f29-4931-b03c-5e0d065dc0b6/resourceGroups/rg-spoke1/.../routeTables/rt-spoke1"
#   subnet_id      = module.nw_virtual.subnet_ids["spoke1_app"]
#   route_table_id = module.rt_spoke.route_table_ids["spoke1_rt"]
# }

# spoke2 = {
# subnet_id      = "/subscriptions/05fdc691-9f29-4931-b03c-5e0d065dc0b6/resourceGroups/rg-spoke2/virtualNetworks/vnet-prod-spoke2-weu/subnets/AppSubnet"
# route_table_id = "/subscriptions/05fdc691-9f29-4931-b03c-5e0d065dc0b6/resourceGroups/rg-spoke2/.../routeTables/rt-spoke2"
#     subnet_id      = module.nw_virtual.subnet_ids["spoke2_app"]
#     route_table_id = module.rt_spoke.route_table_ids["spoke2_rt"]
#   }
# }

lan_hub_gw = {
  lan_hub = {
    name          = "lng-hub"
    rg_name       = "rg-hub"
    location      = "west us"
    address_space = ["10.4.0.0/16"]
    pip_name      = "on_prem_pip"
  }
}
