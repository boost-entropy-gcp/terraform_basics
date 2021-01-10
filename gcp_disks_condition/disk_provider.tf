# New syntax
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.51"
    }
  }
}
provider "google" {
  project = var.project_name
  region  = "us-central1"
}
