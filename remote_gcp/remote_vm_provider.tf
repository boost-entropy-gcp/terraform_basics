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
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "my-tfstate-bucket-4030" # GCS bucket name to store terraform tfstate
    # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
    prefix = "terraform/first-app/"
  }
}
