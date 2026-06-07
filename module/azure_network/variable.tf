variable "virtual_nw" {
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
