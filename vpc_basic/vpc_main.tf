resource "google_compute_network" "vpc" {
  name                    = "customvpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

locals {
  subnet_01 = "${var.network_name}-subnet-01"
  subnet_02 = "${var.network_name}-subnet-02"
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = local.subnet_01
  ip_cidr_range = var.public_subnet
  network       = google_compute_network.vpc.self_link
  region        = var.region
}

resource "google_compute_subnetwork" "private_subnet" {
  name                     = local.subnet_02
  ip_cidr_range            = var.private_subnet
  network                  = google_compute_network.vpc.self_link
  region                   = var.region
  private_ip_google_access = "true"
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

