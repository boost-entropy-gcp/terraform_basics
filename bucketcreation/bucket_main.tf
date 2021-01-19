
resource "random_id" "my-random-id" {
  byte_length = 2
}

# Create a GCS Bucket
resource "google_storage_bucket" "tf-bucket" {
  project       = var.project_name
  name          = "${var.bucket_name}-${random_id.my-random-id.dec}"
  location      = var.region
  force_destroy = true
  storage_class = var.storage_class
  versioning {
    enabled = true
  }
}
output "Bucket_name" {
  value = google_storage_bucket.tf-bucket.name
}
