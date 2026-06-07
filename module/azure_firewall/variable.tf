variable "lb_firewall" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    sku_name = string
    sku_tier = string
    # subnet_id = string
    pip_name    = string
    subnet_name = string
    vnet_name = string
  }))
}
