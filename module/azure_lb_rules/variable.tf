# variable "lb_rules" {
#   type = map(object({
#     name                           = string
#     protocol                       = string
#     frontend_port                  = number
#     backend_port                   = number
#     frontend_ip_configuration_name = string
#   }))
# }
# variable "lb_id" {
#   type = string
# }