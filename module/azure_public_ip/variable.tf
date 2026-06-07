variable "engress_pip" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}
