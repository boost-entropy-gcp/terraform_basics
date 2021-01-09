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
  project = "devops-automation-287700"
  region  = "us-central1"
}
