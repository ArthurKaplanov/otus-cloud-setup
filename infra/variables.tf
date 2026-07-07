variable "yc_zone" {
  description = "Yandex Cloud availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "yc_folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "yc_cloud_id" {
  description = "Yandex Cloud cloud ID"
  type        = string
}

variable "yc_network_name" {
  type        = string
  description = "Name of the network"
}

variable "yc_subnet_name" {
  type        = string
  description = "Name of the custom subnet"
}

variable "yc_subnet_range" {
  type        = string
  description = "CIDR block for the subnet"
}

variable "yc_nat_gateway_name" {
  type        = string
  description = "Name of the NAT gateway"
}

variable "yc_route_table_name" {
  type        = string
  description = "Name of the route table"
}

variable "yc_security_group_name" {
  type        = string
  description = "Name of the security group"
}

variable "yc_bucket_name" {
  type        = string
  description = "Name of the bucket"
}

variable "yc_service_account_name" {
  type        = string
  description = "Name of the service account"
  default     = "value"
}