variable "vnc_user" {
  type = string
  default = "root"
}

variable "vnc_password" {
  type =  string
  default = "nutanix/4u"
  sensitive = true
}

variable "nutanix_username" {
  type = string
  default = "admin"
}

variable "nutanix_password" {
  type =  string
  default = "nutanix/4u"
  sensitive = true
}

variable "nutanix_endpoint" {
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

variable "nutanix_user_data" {
  type = string
}

variable "nutanix_user_data_windows" {
  type = string
}

