variable "spoke_rt" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
