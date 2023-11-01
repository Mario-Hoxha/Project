variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnets" {
  type = map
  default = {
    a = "10.0.1.0/24"
    b = "10.0.2.0/24"
  }
}

variable "app_name" {
  type = string
}