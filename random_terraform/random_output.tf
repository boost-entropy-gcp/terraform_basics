# Output of the random string
output "resource_code" {
  value = random_string.resource_code.result
}

# full object
output "my_id" {
  value = random_id.my_id
}
# random id output with only ID which we will use for most cases
output "random_id" {
  value = random_id.my_id.id
}
# Random integer output
output "my_integer" {
  value = random_integer.my_integer.result
}
# Random pet output
output "my_name" {
  value = random_pet.my_name.id
}
# Random shuffle output
output "my_numbers" {
  value = random_shuffle.my_numbers.result
}
# random password
output "random_password" {
  value = random_password.my_password
}
# random password id
output "random_password_result" {
  value = random_password.my_password.result
}
