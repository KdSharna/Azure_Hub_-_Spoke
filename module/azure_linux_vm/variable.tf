variable "linux_vm" {
  type = map(object({
    name          = string
    computer_name = string
    rg_name       = string
    location      = string
    size          = string
    nic           = string
    kv_name       = string
    script_name   = optional(string)
    source_image_reference = map(object({
      publisher = string
      version   = string
      sku       = string
      offer     = string
    }))
  }))
}

variable "custom_data" {
  type    = string
  default = null
}
