resource "yandex_resourcemanager_folder" "folder_for_terraform" {
  name = "ya-praktikum"
  cloud_id = var.cloud_id
}