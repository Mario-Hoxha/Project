variable "app_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "DbName" {
  type = string
}

variable "DbPassword" {
  type = string
}

variable "DbUser" {
  type = string
}

variable "DbEngine" {
  type = string
  default = "postgres"
}