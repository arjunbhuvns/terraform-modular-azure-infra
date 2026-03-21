variable "nics" {
  type = map(object({
    name       = string
    rg_key     = string
    subnet_key = string
    public_ip_key = string  

    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
    })
    }
  ))
}



variable "rg_output" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "subnet_output" {}

variable "public_ip_output" {}