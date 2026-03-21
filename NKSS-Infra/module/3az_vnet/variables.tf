variable "vnet" {
  type = map(object({

    #Required Variables
    name = string
    # location            = string /*we are not passing location and resource group name as variables because we can get those values from the imported resource group variable using the rg_key*/
    # resource_group_name = string /*we are not passing location and resource group name as variables because we can get those values from the imported resource group variable using the rg_key*/
    rg_key        = string
    address_space = list(string)
    dns_servers   = list(string)

    tags = optional(map(string), {
      owner       = "Arjun"
      environment = "Dev"
  }) }))
}

variable "rg_output" {
  type = map(object({
    name     = string
    location = string
  }))
}

