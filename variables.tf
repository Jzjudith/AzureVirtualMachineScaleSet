variable "resource_group_name" {
  description = "The nmae of the resource group"
  default     = "devlab-vmss-rg"
}

variable "location" {
  description = "The location where the resources would be created"
  default     = "East US2"
}

variable "loadbpip" {
  description = "The ip address loadbalancer"
  default     = "loadbpip"
}

variable "outboundpip" {
  description = "The outbound rule public ip address"
  default     = "outboundpip"
}

variable "address_space" {
  description = "The address space of the vitual network"
  default     = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  description = "The address prefixes of the subnet"
  default     = ["10.0.2.0/24"]
}

variable "lb_name" {
  description = "The name of the load balancer"
  default     = "devvmsslb"
}

variable "tags" {
  description = "The tags attached to the resources"
  default = {
    environment = "Development"
  }
}
