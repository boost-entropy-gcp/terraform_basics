resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type["dev"]
  zone         = var.vm_zones[1]

  tags = ["foo", "bar"]

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
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [attached_disk]
  }
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_disk" "vm1-disk" {
  count = local.is_prod ? 1 : 0
  name  = var.disk_name
  type  = "pd-ssd"
  size  = 15
  zone  = var.vm_zones[1]
}

locals {
  is_prod = var.env_name == "prod" || var.env_name == "sandbox" ? true : false
}
resource "google_compute_attached_disk" "vm_attached_disk" {
  count      = local.is_prod ? 1 : 0
  depends_on = [google_compute_disk.vm1-disk]
  disk       = google_compute_disk.vm1-disk[count.index].id
  instance   = google_compute_instance.vm_instance.self_link
}
