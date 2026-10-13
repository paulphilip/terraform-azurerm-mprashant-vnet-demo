variable "rg-config" {
  type = object({
    name     = string
    location = string
  })
}

variable "vnet-config" {
  type = object({
    name          = string
    address_space = set(string)
  })
}

variable "subnet-config" {
  type = object({
    name             = string
    address_prefixes = list(string)
  })
}
