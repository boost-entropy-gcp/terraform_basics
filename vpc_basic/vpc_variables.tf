variable project_name {
  type        = string
  description = "Name of the project"
}


variable vm_name {
  type        = string
  description = "Name of the VM machine"
  default     = "sandboxtest"
}

variable region {
  type        = string
  description = "Name of the Region"
  default     = "us-central1"
}
variable network_name {
  type        = string
  description = "Name of the Network"
  default     = "customvpc"
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


variable "public_subnet" {
  default = "10.26.1.0/24"
}

variable "private_subnet" {
  default = "10.26.2.0/24"
}
