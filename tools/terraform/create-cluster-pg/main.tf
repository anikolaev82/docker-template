data "yandex_vpc_network" "default-network" {
  folder_id  = var.folder_id
  network_id = "enpsir6u1eo1hg23tolb"
}

data "yandex_vpc_subnet" "default-subnet" {
  folder_id = var.folder_id
  subnet_id = "e9bs57r3romloojmn4b4"
}


resource "yandex_mdb_postgresql_cluster" "pg-cluster" {
  name        = "pg_cluster"
  environment = "PRESTABLE"
  network_id  = data.yandex_vpc_network.default-network.id

  config {
    version = 12
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 16
    }
    postgresql_config = {
      max_connections                   = 395
      enable_parallel_hash              = true
      vacuum_cleanup_index_scale_factor = 0.2
      autovacuum_vacuum_scale_factor    = 0.34
      default_transaction_isolation     = "TRANSACTION_ISOLATION_READ_COMMITTED"
      shared_preload_libraries          = "SHARED_PRELOAD_LIBRARIES_AUTO_EXPLAIN,SHARED_PRELOAD_LIBRARIES_PG_HINT_PLAN"
    }
  }

  maintenance_window {
    type = "WEEKLY"
    day  = "SAT"
    hour = 12
  }

  host {
    zone      = var.zone
    subnet_id = data.yandex_vpc_subnet.default-subnet.id
  }
}

resource "yandex_mdb_postgresql_user" "pg_user" {
  cluster_id = yandex_mdb_postgresql_cluster.pg-cluster.id
  name       = "db"
  password   = "password"
  conn_limit = 50
  settings = {
    default_transaction_isolation = "read committed"
    log_min_duration_statement    = 5000
  }
}