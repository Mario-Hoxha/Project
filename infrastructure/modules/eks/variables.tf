variable "app_name" {
  type = string
  default = "value"
}

variable "subnets" {
  type = list(string)
}

variable "desired-nodes" {
  type = number
  default = 2
}

variable "min-nodes" {
 type = number
 default =  1
}

variable "max-nodes" {
  type = number
  default = 3
}