variable project_name {
  type        = string
  description = "Name of the project"
}


variable vm_name {
  type        = string
  description = "Name of the VM machine"
  default     = "sandboxtest"
}


variable vm_machine_type {
  type        = map(string)
  description = "Different machine types based on environment"
  default = {
    "dev"     = "f1-micro",
    "sandbox" = "n2-standard-2",
    "prod"    = "n2-standard-4",
  }
}

variable "vm_zones" {
  type        = list
  description = "list of vm_zones"
  default     = ["us-central1-a", "us-central1-b", "us-central1-c"]
}
