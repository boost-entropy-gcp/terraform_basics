# https://discuss.hashicorp.com/t/how-to-add-availability-zones-to-a-for-each-loop-based-on-number-of-vms/13718/2
locals {
  name = var.vm_name
  instance = { for i, server_name in local.name : server_name => {
    node_name = server_name
    zone      = element(var.zones, i)
    }
  }
}
resource "google_compute_instance" "vm_instance" {
  for_each     = local.instance
  name         = each.value.node_name
  machine_type = var.vm_machine_type["dev"]
  zone         = each.value.zone
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

