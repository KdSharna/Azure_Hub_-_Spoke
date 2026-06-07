variable "sqldatabase" {
  type = map(object({
    name         = string
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
