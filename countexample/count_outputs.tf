# output "vm_ip" {
#   value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
# }
# output "vm-ip" {
#   value = data.google_compute_instance.my_ip.network_interface.0.access_config.0.nat_ip
# }
output "my_ip" {
  value = { for k, v in google_compute_instance.vm_instance : k => v.network_interface.0.access_config.0.nat_ip }
}

output "ip_name_value" {
  value = { for vmip in google_compute_instance.vm_instance : vmip.name => vmip.network_interface.0.access_config.0.nat_ip }

}
output "az_name_value" {
  value = { for zone in google_compute_instance.vm_instance : zone.name => zone.zone }

}
output "vm_ip" {
  value = zipmap(
    google_compute_instance.vm_instance.*.name,
    #google_compute_instance.vm_instance.*.id,
  google_compute_instance.vm_instance.*.network_interface.0.access_config.0.nat_ip)
}


# A map of names and ids can be output in a columnar manner:

output "map_name_id" {
  value = map("name",
    google_compute_instance.vm_instance.*.name,
    "id",
  google_compute_instance.vm_instance.*.id)
}
# A list of names and ids can be output in a columnar manner:

output "list_ip" {
  value = list(
    google_compute_instance.vm_instance.*.name,
  google_compute_instance.vm_instance.*.network_interface.0.access_config.0.nat_ip)
}

# output multiple values in one output
output "multi_value" {
  value = {
    for vmip in google_compute_instance.vm_instance :
    vmip.name => ({ "PrivateIPAddress" = vmip.network_interface.0.network_ip, "zones" = vmip.zone,
    "PublicIPAddress" = vmip.network_interface.0.access_config.0.nat_ip })
  }
}
