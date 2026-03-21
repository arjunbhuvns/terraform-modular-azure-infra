variable "public_ip" {
  type = map(object({
    name = string
    # resource_group_name = string
    # location            = string
    rg_key            = string
    allocation_method = string

   }))
}

#rg ka value recive karne ke liye variable define karna hoga
variable "rg_output" {}