variable "PC_USER" {
  type = string
}

variable "PC_PASS" {
  type =  string
}

variable "PC_ENDPOINT" {
  type = string
}

variable "nutanix_insecure" {
  type = bool
  default = true
}

variable "nutanix_subnet" {
  type = string
}

variable "nutanix_cluster" {
  type = string
}

