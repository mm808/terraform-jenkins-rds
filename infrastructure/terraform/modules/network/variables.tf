variable "vpc_cidr"{
  description = "cidr block of vpc"
  type        = list(string)
}

variable "vpc-id" {
  description = "vpc id"
  type = string
}

variable "env" {
  description = "env"
  type = string
}
