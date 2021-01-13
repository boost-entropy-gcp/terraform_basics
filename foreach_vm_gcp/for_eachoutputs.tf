# To return both as a list (order will be same as for keys function):
output "vm_ip" {
  value = values(google_compute_instance.vm_instance)[*].network_interface.0.access_config.0.nat_ip
}
# values(aws_lb_target_group.target-group)[*].arn
