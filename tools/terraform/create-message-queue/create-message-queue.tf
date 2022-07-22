variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

resource "yandex_message_queue" "example_queue" {
  name = "mq-terraform"
  visibility_timeout_seconds = 600
  receive_wait_time_seconds = 20
  message_retention_seconds = 1209600
  access_key = var.access_key
  secret_key = var.secret_key
}