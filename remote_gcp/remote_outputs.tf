# output "vm_ip" {
#   value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
# }
output "vm-ip" {
  value = data.google_compute_instance.my_ip.network_interface.0.access_config.0.nat_ip
}
