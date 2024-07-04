variable "name" {
  type        = string
  description = "vpc name"
}

variable "cidr" {
  type        = string
  description = "vpc cidr block"
}

variable "subnets" {
  type = list(object({

    cidr              = string
    visibility        = string
    availability_zone = string

  }))
  description = "subnets to create"
}

variable "enable_nat_gateway" {
  type        = bool
  default     = false
  description = "optionally create a nat gateway"
}
