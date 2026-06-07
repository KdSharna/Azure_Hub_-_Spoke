variable "hub_lan_gw" {
  type = map(object({
    name          = string
    location      = string
    address_space = list(string)
    pip_name      = string
    rg_name       = string
  }))
}
