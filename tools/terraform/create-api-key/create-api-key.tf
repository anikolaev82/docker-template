variable "service_account_id" {
  type = string
}


resource "yandex_iam_service_account_api_key" "sa-api-key" {
  service_account_id = ""
}