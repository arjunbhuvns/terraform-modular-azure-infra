variable "stg" {
  type = map(object({
    name                     = string
    account_tier             = string
    account_replication_type = string
    rg_key                   = string   # 🔥 MUST BE HERE
    tags                     = optional(map(string))
  }))
}

variable "rg_output" {
  type = map(object({
    name     = string
    location = string
  }))
}
