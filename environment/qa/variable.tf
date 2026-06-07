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
    pip_name    = optional(string)
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

# variable "login_bastion" {
#   type = map(object({
#     name        = string
#     location    = string
#     rg_name     = string
#     subnet_name = string
#     vnet_name   = string
#     pip_name    = string

#   }))
# }

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

# variable "nsg_subnet_map" {
#   type = map(list(string))
# }
# tflint-ignore: terraform_unused_declarations
variable "nsg_subnet_associate" {
  type = map(list(string))
}

variable "lb_main" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    pip_name = string
    frontend_ip_configuration = map(object({
      name = string
    }))
  }))
}

variable "rules_lb" {
  type = map(object({
    name                           = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
  }))
}

variable "probe_lb" {
  type = map(object({
    name = string
    port = string
  }))
}

variable "pool_back" {
  type = map(object({
    name = string
  }))
}

variable "pool_nat" {
  type = map(object({
    name                           = string
    protocol                       = string
    frontend_port_start            = number
    frontend_port_end              = number
    backend_port                   = number
    frontend_ip_configuration_name = string
    rg_name                        = string
  }))
}

# variable "firewall_lb" {
#   type = map(object({
#     name     = string
#     location = string
#     rg_name  = string
#     sku_name = string
#     sku_tier = string
#   }))
# }
