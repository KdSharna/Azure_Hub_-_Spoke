variable "name_rg" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
  }))
}

variable "pip_engress" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}

variable "name_nic" {
  type = map(object({
    name        = string
    rg_name     = string
    location    = string
    subnet_name = string
    vnet_name   = string
    # pip_name    = optional(string)
    ip_forward = optional(bool)
  }))
}

variable "nw_virtual" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    dns_servers         = list(string)
    subnet = list(object({
      name             = string
      address_prefixes = list(string)

    }))
  }))
}

variable "vm_linux" {
  type = map(object({
    name          = string
    computer_name = string
    rg_name       = string
    location      = string
    size          = string
    nic           = string
    kv_name       = string
    script_name   = optional(string)
    # pip_name = string
    source_image_reference = map(object({
      publisher = string
      version   = string
      sku       = string
      offer     = string
    }))
  }))
}

variable "serversql" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))
}

variable "databasesql" {
  type = map(object({
    name = string
    # server_id    = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
    sql_name     = string
    rg_name      = string
  }))
}

variable "login_bastion" {
  type = map(object({
    name        = string
    location    = string
    rg_name     = string
    subnet_name = string
    vnet_name   = string
    pip_name    = string

  }))
}

variable "nsg_my" {
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
    security_rule = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

# variable "nsg_subnet_associate" {
#   type = map(list(string))
# }

# variable "lb_main" {
#   type = map(object({
#     name     = string
#     location = string
#     rg_name  = string
#     pip_name = string
#     frontend_ip_configuration = map(object({
#       name = string
#     }))
#   }))
# }

# variable "rules_lb" {
#   type = map(object({
#     name                           = string
#     protocol                       = string
#     frontend_port                  = number
#     backend_port                   = number
#     frontend_ip_configuration_name = string
#   }))
# }

# variable "probe_lb" {
#   type = map(object({
#     name = string
#     port = string
#   }))
# }

# variable "pool_back" {
#   type = map(object({
#     name = string
#   }))
# }

# variable "pool_nat" {
#   type = map(object({
#     name                           = string
#     protocol                       = string
#     frontend_port_start            = number
#     frontend_port_end              = number
#     backend_port                   = number
#     frontend_ip_configuration_name = string
#     rg_name                        = string
#   }))
# }

variable "firewall_lb" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    sku_name = string
    sku_tier = string
    # subnet_id = string
    pip_name    = string
    subnet_name = string
    vnet_name   = string
  }))
}

# variable "vault_keys" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     sku_name            = string
#   }))
# }

variable "gw_nat" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    sku_name                = string
    idle_timeout_in_minutes = number
    zones                   = list(string)
  }))
}

variable "peering_vnet" {
  type = map(object({
    name                      = string
    resource_group_name       = string
    virtual_network_name      = string
    remote_virtual_network_id = string
    allow_gateway_transit     = bool
    use_remote_gateways       = bool
  }))
}

variable "vpn_hub" {
  type = map(object({
    name          = string
    location      = string
    type          = string
    vpn_type      = string
    active_active = bool
    enable_bgp    = bool
    sku           = string
    subnet_name   = string
    vnet_name     = string
    pip_name      = string
    rg_name       = string
  }))
}

variable "rt_spoke" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "r_spoke" {
  type = map(object({
    name                   = string
    resource_group_name    = string
    route_table_name       = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))
}

# variable "assoc_subnet_rt" {
#   type = map(object({
#     subnet_id      = string
#     route_table_id = string
#   }))
# }

variable "lan_hub_gw" {
  type = map(object({
    name          = string
    location      = string
    address_space = list(string)
    pip_name      = string
    rg_name       = string
  }))
}
