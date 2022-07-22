source "yandex" "ubuntu-nginx" {
  token = "OAUTHtoken"
  folder_id = "id folder"
  source_image_family = "ubuntu-2004-lts"
  ssh_username = "ubuntu"
  use_ipv4_nat = "true"
  image_description = "my custom ubuntu with nginx"
  image_family = "ubuntu-2004-lts"
  image_name = "my-ubuntu-nginx"
  subnet_Id = "id subnet"
  disk_type = "network-ssd"
  zone = "ru-central1-b"
}

build {
  source = ["source.yandex.ubuntu.nginx"]

  provisioner "shell" {
    inline = ["sudo apt-get update -y",
              "sudo apt-get install -y nginx",
              "sudo systemctl enable nginx.service"]
  }
}