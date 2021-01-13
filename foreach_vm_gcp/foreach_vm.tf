# locals {
#   zones = toset(var.vm_zones)
# }

resource "google_compute_instance" "vm_instance" {
  for_each     = toset(var.vm_name)
  name         = each.value
  machine_type = var.vm_machine_type["dev"]
  zone         = var.vm_zones[0]
  tags         = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
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

