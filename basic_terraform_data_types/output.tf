# Getting the output of number 
output "number" {
  value = var.number_example
}
# Getting the output of list variable
output "list_out" {
  value = var.list_example
}
# Getting the output of first element of list variable
output "list_out_1" {
  value = var.list_example[0]
}
# Getting the output of second element of list variable
output "list_out_2" {
  value = var.list_example[1]
}
output "list_out_num1" {
  value = var.list_example_numberic[1]
}
# Getting the output of map variable
output "map_out_str" {
  value = var.map_example
}
# Getting the output of first element of map variable
output "map_out_str1" {
  value = var.map_example["key1"]
}
# Getting the output of  object 
output "map_out_object" {
  value = var.object_example
}
# Getting the output of first object 
output "map_out_object1" {
  value = var.object_example["name"]
}
# Getting the output of tags object 
output "map_out_object_tags1" {
  value = var.object_example["tags"][0]
}
# Getting the output of boolean object 
output "map_out_object_bool" {
  value = var.object_example["enabled"]
}
# Getting the output of secret text ., it will not print the output value
output "sens_example" {
  value     = var.sens_example
  sensitive = true
}
