variable "rg_output" {
  type = map(object({
    name     = string
    location = string
  }))
}
variable "nic_output" {
}

variable "vms" {

}