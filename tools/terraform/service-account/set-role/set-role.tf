variable "cloud_id" {
  type = string
}

variable "role" {
  type = string
}


variable "service_accounts" {
  type = map(any)
}
resource "yandex_resourcemanager_cloud_iam_binding" "admin-account-iam" {
  cloud_id = var.cloud_id
  members  = var.service_accounts
  role     = var.role
}