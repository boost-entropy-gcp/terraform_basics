variable "bucket_name" {
  description = "GCS Bucket name. Value should be unique ."
  type        = string
  default     = "my-tfstate-bucket"
}


variable "storage_class" {
  description = "Specify the storage class"
  type        = string
  default     = "REGIONAL"
}
variable project_name {
  type        = string
  description = "Name of the project"
}

variable region {
  type        = string
  description = "zone of the project"
  default     = "us-central1"
}
