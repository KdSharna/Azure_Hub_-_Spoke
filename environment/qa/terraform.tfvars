name_rg = {
  rg1 = {
    name       = "tittu11"
    location   = "west us 2"
    managed_by = "Terraform"
  }
}

pip_engress = {
  pip1 = {
    name                = "fe_pip"
    resource_group_name = "tittu11"
    location            = "west us 2"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip2 = {
    name                = "be_pip"
    resource_group_name = "tittu11"
    location            = "west us 2"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip3 = {
    name                = "main_pip"
    resource_group_name = "tittu11"
    location            = "west us 2"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

name_nic = {
  nic1 = {
    name        = "fe_nic"
    rg_name     = "tittu11"
    location    = "west us 2"
    subnet_name = "fe_subnet"
    vnet_name   = "fe_vnet"
    pip_name    = "fe_pip"
  }
  nic2 = {
    name        = "be_nic"
    rg_name     = "tittu11"
    location    = "west us 2"
    subnet_name = "be_subnet"
    vnet_name   = "fe_vnet"
    pip_name    = "be_pip"
  }
  # nic3 = {
  #   name        = "main_nic"
  #   rg_name     = "tittu11"
  #   location    = "west us 2"
  #   subnet_name = "main_subnet"
  #   vnet_name   = "fe_vnet"
  #   pip_name    = "be_pip"
  # }
}

nw_virtual = {
  vnet1 = {
    name                = "fe_vnet"
    resource_group_name = "tittu11"
    location            = "west us 2"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["8.8.8.8", "8.8.4.4"]

    subnet = [
      {
        name             = "fe_subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "be_subnet"
        address_prefixes = ["10.0.2.0/24"]
      },
      {
        name             = "main_subnet"
        address_prefixes = ["10.0.3.0/24"]
      },
      {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.4.0/24"]
      },
      {
        name             = "AzureFirewallSubnet"
        address_prefixes = ["10.0.5.0/24"]
      }
    ]

  }
}

vm_linux = {
  vm1 = {
    name           = "fe_vm"
    computer_name  = "fevm01"
    rg_name        = "tittu11"
    location       = "west us 2"
    size           = "Standard_D2s_v3"
    nic            = "fe_nic"
    kv_name        = "my-secrete02"
    admin_username = "vm-username"
    admin_password = "vm-password"
    vnet_name      = "fe_vnet"
    subnet_name    = "fe_subnet"
    script_name    = "nginx.yaml"
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
    name           = "be_vm"
    computer_name  = "bevm01"
    rg_name        = "tittu11"
    location       = "west us 2"
    size           = "Standard_D2s_v3"
    nic            = "be_nic"
    kv_name        = "my-secrete02"
    admin_username = "vm-username"
    admin_password = "vm-password"
    vnet_name      = "fe_vnet"
    subnet_name    = "be_subnet"
    script_name    = "python.yaml"
    source_image_reference = {
      image1 = {
        publisher = "Canonical"
        version   = "latest"
        sku       = "22_04-lts"
        offer     = "0001-com-ubuntu-server-jammy"
      }
    }
  }
  # vm3 = {
  #   name           = "main_vm01"
  #   computer_name  = "mainvm01"
  #   rg_name        = "tittu11"
  #   location       = "west us 2"
  #   size           = "Standard_D2s_v3"
  #   nic            = "main_nic"
  #   kv_name        = "my-secrete02"
  #   admin_username = "vm-username"
  #   admin_password = "vm-password"
  #   vnet_name      = "fe_vnet"
  #   subnet_name    = "main_subnet"
  #   # script_name    = "python.yaml"
  #   source_image_reference = {
  #     image1 = {
  #       publisher = "Canonical"
  #       version   = "latest"
  #       sku       = "22_04-lts"
  #       offer     = "0001-com-ubuntu-server-jammy"
  #     }
  #   }
  # }
}


serversql = {
  server1 = {
    name                         = "mysqlservertittu123"
    resource_group_name          = "tittu11"
    location                     = "west us 2"
    version                      = "12.0"
    administrator_login          = "Tattu01!@"
    administrator_login_password = "Tattu!12345"
    minimum_tls_version          = "1.2"

  }
}

databasesql = {
  database1 = {
    name         = "mysqldatabase"
    sql_name     = "mysqlservertittu123"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    rg_name      = "tittu11"
  }
}

# login_bastion = {
#   bastion1 = {
#     name        = "my_bastion"
#     location    = "west us 2"
#     rg_name     = "tittu11"
#     subnet_name = "AzureBastionSubnet"
#     vnet_name   = "fe_vnet"
#     pip_name    = "fe_pip"

#   }
# }

nsg_my = {
  fe_nsg = {
    nsg_name = "fe_nsg"
    location = "west us 2"
    rg_name  = "tittu11"
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

  be_nsg = {
    nsg_name = "be_nsg"
    location = "west us 2"
    rg_name  = "tittu11"
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
}


nsg_subnet_associate = {
  fe_nsg = ["fe_subnet"]
  be_nsg = ["be_subnet"]
}

lb_main = {
  lb_main1 = {
    name     = "my_lb_main"
    location = "west us 2"
    rg_name  = "tittu11"
    pip_name = "main_pip"
    frontend_ip_configuration = {
      fe1 = {
        name = "PublicFrontEnd"
      }
    }
  }
}

rules_lb = {
  rules_lb1 = {
    name                           = "my_lb_rules"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "PublicFrontEnd"
    # loadbalancer_id                = var.lb_id
  }
}

probe_lb = {
  probe_lb1 = {
    name = "my_probe_lb"
    port = 80
    # loadbalancer_id = azurerm_lb.lb.id
  }
}

pool_back = {
  pool_back1 = {
    name = "my_pool_back"
    # loadbalancer_id = azurerm_lb.lb.id
  }
}

pool_nat = {
  pool_nat1 = {
    name                           = "my_pool_nat"
    protocol                       = "Tcp"
    frontend_port_start            = 8000
    frontend_port_end              = 8080
    backend_port                   = 22
    frontend_ip_configuration_name = "PublicFrontEnd"
    rg_name                        = "tittu11"
    # loadbalancer_id                = azurerm_lb.lb.id
  }
}

# firewall_lb = {
#   fw1 = {
#     name     = "my_firewall"
#     location = "west us 2"
#     rg_name  = "tittu11"
#     sku_name = "AZFW_VNet"
#     sku_tier = "Standard"
#   }
# }
