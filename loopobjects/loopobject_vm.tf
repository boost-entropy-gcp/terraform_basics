# locals {
#   zones = toset(var.vm_zones)
# }

resource "google_compute_instance" "vm_instance" {
  for_each     = var.hosts
  name         = each.value.hostname
  machine_type = each.value.machine
  zone         = each.value.zone
  tags         = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = each.value.os
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

