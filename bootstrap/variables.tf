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

variable "yc_access_key" {
  type        = string
  description = "access key"
}

variable "yc_secret_key" {
  type        = string
  description = "secret key"
}

variable "yc_service_account_name" {
  type        = string
  description = "Name of the service account"
  default     = "value"
}