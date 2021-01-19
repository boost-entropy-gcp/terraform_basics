resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type["dev"]
  zone         = data.google_compute_zones.available.names[2]

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
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

data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}

data "google_compute_zones" "available" {
  # project = var.project_name
  # region = var.region
}

data "google_compute_instance" "my_ip" {
  self_link = google_compute_instance.vm_instance.self_link
}