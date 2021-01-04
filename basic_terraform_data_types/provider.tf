# New syntax
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.51"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }
}
provider "google" {
  project = "devops-automation-287700"
  region  = "us-central1"
}
