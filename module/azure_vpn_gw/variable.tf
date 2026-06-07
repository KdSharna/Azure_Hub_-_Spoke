variable "hub_vpn" {
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
