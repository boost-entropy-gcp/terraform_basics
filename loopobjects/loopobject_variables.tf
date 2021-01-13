variable project_name {
  type        = string
  description = "Name of the project"
}


# variable vm_name {
#   type        = list(string)
#   description = "Name of the VM machine"
#   default     = ["vmnode1", "vmnode2"]
# }


# variable vm_machine_type {
#   type        = map(string)
#   description = "Different machine types based on environment"
#   default = {
#     "dev"     = "f1-micro",
#     "sandbox" = "n2-standard-2",
#     "prod"    = "n2-standard-4",
#   }
# }

# variable "vm_zones" {
#   type        = list(string)
#   description = "list of vm_zones"
#   default     = ["us-central1-a", "us-central1-b"]
# }

variable "hosts" {
    type = map(object({
        hostname        = string,
        machine         = string,
        os              = string,
        zone            = string,
      }
      ))

default = {
    vm_test_one = {
        hostname = "vmnode1",
        machine = "n1-standard-1",
        os = "centos-8"
        zone = "us-central1-a",
    },
    vm_test_two = {
        hostname = "vmnode2",
        machine = "n1-standard-2",
        os = "ubuntu-1804-lts"
        zone = "us-central1-b",
    },
    vm_test_three = {
        hostname = "vmnode3",
        machine = "f1-micro",
        os = "ubuntu-1804-lts"
        zone = "us-central1-c",
    },

}
}